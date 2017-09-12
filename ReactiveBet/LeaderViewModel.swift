//
//  LeaderViewModel.swift
//  ReactiveBet
//
//  Created by Artem Lyksa on 9/12/17.
//  Copyright © 2017 Artem Lyksa. All rights reserved.
//

import Foundation
import RxSwift

class LeaderViewModel {
    
    private let dataSourceVariable = Variable<[User]>([])
    private let disposeBag = DisposeBag()
    
    
    var dataSource: Observable<[User]> {
        return dataSourceVariable.asObservable()
    }
    
    init() {
        self.fillDataSource()
    }
    
    func fillDataSource() {
        let _ = Observable<Int>
            .interval(RxTimeInterval(5.0), scheduler: MainScheduler.instance)
            .subscribe(onNext: {_ in
                let name = "Test#\(arc4random_uniform(100))"
                let score = Int(arc4random_uniform(1000))
                let activity = "Some activity"
                let user = User(name: name, score: score, activity: activity, image: #imageLiteral(resourceName: "ic_account_circle"))
                self.dataSourceVariable.value.append(user)
                self.dataSourceVariable.value = self.dataSourceVariable.value.sorted(by: { $0.score > $1.score })
            })
    }
}
