//
//  ChallengeViewModel.swift
//  ReactiveBet
//
//  Created by Artem Lyksa on 9/12/17.
//  Copyright © 2017 Artem Lyksa. All rights reserved.
//

import Foundation
import RxSwift

class ChallengeViewModel {
        
    private let challengeSubject = PublishSubject<Challenge>()
    private let disposeBag = DisposeBag()
    private var startDate: Foundation.Date!
    
    var challenge: Observable<Challenge> {
        return challengeSubject.asObservable()
    }

    init() {
        self.startEmitChallenges()
    }
    
    var amountString = Variable<String>("amount")
    var timeToStart = PublishSubject<String>()
    
    func startEmitChallenges() {
        let observable = challengeSubject.asObservable()
        
        observable.subscribe(onNext: { challenge in
            self.amountString.value = "\(challenge.amount)$"
            self.timeToStart.onNext("The game starts in")
            self.startDate = challenge.startDate
        })
            
        .addDisposableTo(disposeBag)
        
        let _ = Observable<Int>
            .interval(RxTimeInterval(1.0), scheduler: MainScheduler.instance)
            .takeWhile({ _ in
                self.startDate > Foundation.Date()
            })
            .subscribe(onNext: {_ in
                let calendar = Calendar.current
                let datecomponenets = calendar.dateComponents([.second], from: Foundation.Date(), to: self.startDate)
                let seconds = datecomponenets.second
                self.timeToStart.onNext("The game starts in \(seconds ?? 0)")
            },
                       onCompleted: {
                        self.timeToStart.onNext("Challenge started")
                        self.challengeSubject.onCompleted()
            })
        
        self.randomChallenge()
    }
    
    
    private func randomChallenge() {
        let randomAmount = Int(arc4random_uniform(100))
        let randomInterval = TimeInterval(10)
        let randomDate = Foundation.Date(timeIntervalSinceNow: randomInterval)
        self.challengeSubject.onNext(Challenge(amount: randomAmount, startDate: randomDate))
    }
    
}
