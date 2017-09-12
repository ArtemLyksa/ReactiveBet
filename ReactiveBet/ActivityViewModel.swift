//
//  ActivityViewModel.swift
//  ReactiveBet
//
//  Created by Artem Lyksa on 9/12/17.
//  Copyright © 2017 Artem Lyksa. All rights reserved.
//

import Foundation
import RxSwift


enum ActivityType: Int {
    case message = 0
    case event = 1
    
    var activityMessage: String {
        switch self {
        case .message:
            return "Message"
        case .event:
            return "Event"
        }
    }
}

struct Activity {
    var activityType: ActivityType
    var timeString: String
    var text: String
    var color: UIColor
    var image: UIImage
}

class ActivityViewModel {
    
    private let dataSourceVariable = Variable<[Activity]>([])
    private let disposeBag = DisposeBag()
    private let formatter = DateFormatter()
    
    
    var dataSource: Observable<[Activity]> {
        return dataSourceVariable.asObservable()
    }
    
    
    init() {
        formatter.dateFormat = "HH:mm"
        self.fillDataSource()
    }
    
   private func fillDataSource() {
        let _ = Observable<Int>
            .interval(RxTimeInterval(3.0), scheduler: MainScheduler.instance)
            .subscribe(onNext: {_ in
                if let activityType = ActivityType.init(rawValue: Int(arc4random()) % 2) {
                    let timeString = self.formatter.string(from: Foundation.Date())
                    let activity = Activity(
                        activityType: activityType,
                        timeString: timeString,
                        text: activityType.activityMessage,
                        color: Color.random.value,
                        image: #imageLiteral(resourceName: "ic_account_circle")
                    )
                    self.dataSourceVariable.value.append(activity)
                }
            })
    }
    
    func addMessage(_ message: String) {
        let timeString = self.formatter.string(from: Foundation.Date())
        let activity = Activity(
            activityType: .message,
            timeString: timeString,
            text: message,
            color: Color.random.value,
            image: #imageLiteral(resourceName: "ic_account_circle")
        )
        self.dataSourceVariable.value.append(activity)
    }
    
}

