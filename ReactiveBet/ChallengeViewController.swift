//
//  ChallengeViewController.swift
//  ReactiveBet
//
//  Created by Artem Lyksa on 9/11/17.
//  Copyright © 2017 Artem Lyksa. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Action

class ChallengeViewController: UIViewController {
    
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var activityView: ActivityView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    private let disposeBag = DisposeBag()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.isScrollEnabled = false
        self.setupHeaderBindings()
        headerView.imagePickerButton.rx.action = pickerAction
        activityView.activityButton.rx.bind(to: showActivityAction, input: self.scrollView)
        activityView.leaderBoardButton.rx.bind(to: showLeaderBoardAction, input: self.scrollView)
        //TODO: React on button state changing
    }
    
    
    private let pickerAction: Action<Void, Void> = Action {
        print("PickerAction")
        return Observable.empty()
    }
    
    
    private let showActivityAction: Action<UIScrollView, Void> = Action
    { scrollView in
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        return Observable.empty()
    }
    
    
    private let showLeaderBoardAction: Action<UIScrollView, Void> = Action
    { scrollView in
        let width = UIScreen.main.bounds.width
        scrollView.endEditing(true)
        scrollView.setContentOffset(CGPoint(x: width, y: 0), animated: true)
        return Observable.empty()
    }

    
    private func setupHeaderBindings() {
        let challengeViewModel = ChallengeViewModel()
        
        challengeViewModel.timeToStart
            .bind(to: headerView.timerStaticLabel.rx.text)
            .addDisposableTo(disposeBag)
        
        challengeViewModel.amountString.asObservable()
            .bind(to: headerView.amountLabel.rx.text)
            .addDisposableTo(disposeBag)
        }
}
