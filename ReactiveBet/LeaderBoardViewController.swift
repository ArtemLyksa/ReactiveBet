//
//  LeaderBoardViewController.swift
//  ReactiveBet
//
//  Created by Artem Lyksa on 9/11/17.
//  Copyright © 2017 Artem Lyksa. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources

class LeaderBoardViewController: UIViewController {
 
    //userCell
    @IBOutlet weak var tableView: UITableView!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupCellConfiguration()
    }

    
    
    private func setupCellConfiguration() {
        
        let leaderViewModel = LeaderViewModel()
        leaderViewModel.dataSource
            .bind(to: tableView.rx.items) {
                (tableView: UITableView, index: Int, element: User) in
                
                let userCell = tableView.dequeueReusableCell(withIdentifier: "userCell") as! UserTableViewCell
                userCell.ratingLabel.text = "\(index+1)"
                userCell.userNameLabel.text = element.name
                userCell.userScoreLabel.text = "\(element.score)"
                userCell.userImageView.image = element.image
                return userCell
                
            }
            .addDisposableTo(disposeBag)
    }
}
