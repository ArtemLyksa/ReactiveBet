//
//  User.swift
//  ReactiveBet
//
//  Created by Artem Lyksa on 9/11/17.
//  Copyright © 2017 Artem Lyksa. All rights reserved.
//

import UIKit

class User {
    
    var name: String
    var score: Int
    var activity: String
    let image: UIImage
    
    init(name: String, score: Int, activity: String, image: UIImage) {
        self.name = name
        self.score = score
        self.activity = activity
        self.image = image
    }
}
