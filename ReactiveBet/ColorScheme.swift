//
//  ColorScheme.swift
//  ReactiveBet
//
//  Created by Artem Lyksa on 9/11/17.
//  Copyright © 2017 Artem Lyksa. All rights reserved.
//

import UIKit

enum Color {
    
    case darkBlue
    case darkYellow
    case lightGray
    case white
    
    case custom(hexString: String, alpha: Double)
    
    case random
    
    func withAlpha(_ alpha: Double) -> UIColor {
        return self.value.withAlphaComponent(CGFloat(alpha))
    }
}

extension Color {
    var value: UIColor {
        var instanceColor = UIColor.clear
        
        switch self {
            
        case .darkBlue:            instanceColor = UIColor(hex: "1F4A7C")
        case .darkYellow:          instanceColor = UIColor(hex: "DDB83E")
        case .lightGray:           instanceColor = UIColor.lightGray
        case .white:               instanceColor = UIColor.white
            
        case .custom(let hexValue, let opacity):
            instanceColor = UIColor(hex: hexValue).withAlphaComponent(CGFloat(opacity))
            
        case .random:
            instanceColor = UIColor(red: .random(), green: .random(), blue: .random(), alpha: 1.0)
        }
        
        return instanceColor
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
