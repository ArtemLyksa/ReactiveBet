//
//  HeaderView.swift
//  ReactiveBet
//
//  Created by Artem Lyksa on 9/11/17.
//  Copyright © 2017 Artem Lyksa. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class HeaderView: UIView {

    @IBOutlet weak var challengeStaticLabel: UILabel!
    @IBOutlet weak var timerStaticLabel: UILabel!
    @IBOutlet weak var prizeStaticLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var imagePickerButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.amountLabel.textColor = Color.darkYellow.value
        self.amountLabel.font = Font.init(.labelBold, standardSize: .h0).instance
        self.timerStaticLabel.font = Font.init(.labelBold, standardSize: .h5).instance
        self.challengeStaticLabel.font = Font.init(.labelBold, standardSize: .h4).instance
        self.prizeStaticLabel.font = Font.init(.labelBold, standardSize: .h3).instance
    }

}
