//
//  TextInputView.swift
//  ReactiveBet
//
//  Created by Artem Lyksa on 9/12/17.
//  Copyright © 2017 Artem Lyksa. All rights reserved.
//

import UIKit

class TextInputView: UIView {
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var inputTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = Color.darkBlue.value
    }

}
