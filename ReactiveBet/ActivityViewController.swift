//
//  ActivityViewController.swift
//  ReactiveBet
//
//  Created by Artem Lyksa on 9/11/17.
//  Copyright © 2017 Artem Lyksa. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import RxKeyboard
import Action


class ActivityViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textInputView: TextInputView!
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    private let disposeBag = DisposeBag()
    private let activityViewModel = ActivityViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCellConfiguration()
        self.setupInputConfiguration()
    }
    
    
    private func setupInputConfiguration() {
        RxKeyboard.instance.visibleHeight
            .drive(onNext: { keyboardVisibleHeight in
                DispatchQueue.main.async {
                    self.bottomConstraint.constant = keyboardVisibleHeight
                    UIView.animate(withDuration: 0.3, animations: { 
                        self.view.layoutIfNeeded()
                    })
                }
            })
            .disposed(by: disposeBag)
        
        //TODO: Bind textfield with model 
        
        self.textInputView.inputTextField
            .rx
            .controlEvent(.editingDidEndOnExit)
            .subscribe(onNext: {
                self.textInputView.inputTextField.resignFirstResponder()
                
                self.activityViewModel.addMessage(self.textInputView.inputTextField.text ?? "")
                self.textInputView.inputTextField.text = ""
            })
            .disposed(by: disposeBag)
    }
    

    
    private func setupCellConfiguration() {
        
        
        activityViewModel.dataSource
            .bind(to: tableView.rx.items) {
                (tableView: UITableView, index: Int, element: Activity) in
                
                let chatCell: ChatTableViewCell
                
                switch element.activityType {
                case .event:
                    chatCell = tableView.dequeueReusableCell(withIdentifier: "activityCell") as! ChatTableViewCell
                default:
                    chatCell = tableView.dequeueReusableCell(withIdentifier: "messageCell") as! ChatTableViewCell
                }
                
                chatCell.userImageView.image = element.image
                chatCell.textBackgroundView.backgroundColor = element.color
                chatCell.messageLabel.text = element.text
                chatCell.dateLabel.text = element.timeString
                return chatCell
                
        }
        .addDisposableTo(disposeBag)
        
//        activityViewModel.dataSource
//            .subscribe(onNext: { dataSource in
//                if self.tableView.frame.height > self.tableView.contentSize.height {
//                    return
//                }
//                DispatchQueue.main.async {
//                    self.tableView.setContentOffset(
//                        CGPoint(x: 0, y: self.tableView.contentSize.height - self.tableView.frame.height),
//                        animated: true)
//                }
//        })
//        .addDisposableTo(disposeBag)
    }
}
