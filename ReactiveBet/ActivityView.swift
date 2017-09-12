//
//  ActivityView.swift
//  ReactiveBet
//
//  Created by Artem Lyksa on 9/11/17.
//  Copyright © 2017 Artem Lyksa. All rights reserved.
//

import UIKit

class ActivityView: UIView {

    @IBOutlet weak var activityButton: UIButton!
    @IBOutlet weak var leaderBoardButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.activityButton.backgroundColor = Color.darkBlue.value
        self.leaderBoardButton.backgroundColor = Color.darkYellow.value
        self.activityButton.titleLabel?.font = Font.init(.systemBold, standardSize: .h3).instance
        self.leaderBoardButton.titleLabel?.font = Font.init(.systemBold, standardSize: .h3).instance
        self.activityButton.setTitleColor(Color.white.value, for: .normal)
        self.leaderBoardButton.setTitleColor(Color.white.value, for: .normal)
        
    }

}
