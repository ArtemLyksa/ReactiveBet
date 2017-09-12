//
//  FontScheme.swift
//  ReactiveBet
//
//  Created by Artem Lyksa on 9/11/17.
//  Copyright © 2017 Artem Lyksa. All rights reserved.
//


import UIKit

struct Font {
    
    enum FontType {
        
        // App scheme fonts
        case textField
        case label
        case labelBold
        case labelItalic
        case button
        
        case installed(FontName)
        case custom(String)
        case system
        case systemBold
        case systemItatic
        case systemWeighted(weight: Double)
        case monoSpacedDigit(size: Double, weight: Double)
    }
    
    enum FontSize {
        case standard(StandardSize)
        case custom(Double)
        var value: Double {
            switch self {
            case .standard(let size):
                return size.rawValue
            case .custom(let customSize):
                return customSize
            }
        }
    }
    
    enum FontName: String {
        case HelveticaNeue              = "HelveticaNeue"
        case HelveticaNeueBold          = "HelveticaNeue-Bold"
        case HelveticaNeueLight         = "HelveticaNeue-Light"
        case HelveticaNeueBoldItalic    = "HelveticaNeue-BoldItalic"
        case HelveticaNeueItalic        = "HelveticaNeue-Italic"
    }
    
    enum StandardSize: Double {
        case h0 = 48.0
        case h1 = 24.0
        case h2 = 21.0
        case h3 = 17.0
        case h4 = 15.0
        case h5 = 13.0
        case h6 = 12.0
        case h7 = 10.0
    }
    
    var type: FontType = FontType.system
    var size: FontSize = FontSize.standard(.h1)
    
    init(_ type: FontType, size: FontSize) {
        self.type = type
        self.size = size
    }
    
    init(_ type: FontType, standardSize: StandardSize) {
        self.type = type
        self.size = FontSize.standard(standardSize)
    }
    
    init(_ type: FontType) {
        self.type = type
    }
}

extension Font {
    var instance: UIFont {
        var instanceFont: UIFont!
        switch type {
            
        case .textField:
            guard let font =  UIFont(name: FontName.HelveticaNeue.rawValue, size: CGFloat(size.value)) else {
                fatalError("\(FontName.HelveticaNeue.rawValue) font is not installed, make sure it is added in Info.plist and logged with Utility.logAllAvailableFonts()")
            }
            instanceFont = font
        case .label:
            guard let font =  UIFont(name: FontName.HelveticaNeue.rawValue, size: CGFloat(size.value)) else {
                fatalError("\(FontName.HelveticaNeue.rawValue) font is not installed, make sure it is added in Info.plist and logged with Utility.logAllAvailableFonts()")
            }
            instanceFont = font
        case .labelBold:
            guard let font =  UIFont(name: FontName.HelveticaNeueBold.rawValue, size: CGFloat(size.value)) else {
                fatalError("\(FontName.HelveticaNeue.rawValue) font is not installed, make sure it is added in Info.plist and logged with Utility.logAllAvailableFonts()")
            }
            instanceFont = font
        case .labelItalic:
            guard let font =  UIFont(name: FontName.HelveticaNeueItalic.rawValue, size: CGFloat(size.value)) else {
                fatalError("\(FontName.HelveticaNeue.rawValue) font is not installed, make sure it is added in Info.plist and logged with Utility.logAllAvailableFonts()")
            }
            instanceFont = font
        case .button:
            guard let font =  UIFont(name: FontName.HelveticaNeue.rawValue, size: CGFloat(size.value)) else {
                fatalError("\(FontName.HelveticaNeue.rawValue) font is not installed, make sure it is added in Info.plist and logged with Utility.logAllAvailableFonts()")
            }
            instanceFont = font
        case .custom(let fontName):
            guard let font =  UIFont(name: fontName, size: CGFloat(size.value)) else {
                fatalError("\(fontName) font is not installed, make sure it is added in Info.plist and logged with Utility.logAllAvailableFonts()")
            }
            instanceFont = font
        case .installed(let fontName):
            guard let font =  UIFont(name: fontName.rawValue, size: CGFloat(size.value)) else {
                fatalError("\(fontName.rawValue) font is not installed, make sure it is added in Info.plist and logged with Utility.logAllAvailableFonts()")
            }
            instanceFont = font
        case .system:
            instanceFont = UIFont.systemFont(ofSize: CGFloat(size.value))
        case .systemBold:
            instanceFont = UIFont.boldSystemFont(ofSize: CGFloat(size.value))
        case .systemItatic:
            instanceFont = UIFont.italicSystemFont(ofSize: CGFloat(size.value))
        case .systemWeighted(let weight):
            instanceFont = UIFont.systemFont(ofSize: CGFloat(size.value),
                                             weight: CGFloat(weight))
        case .monoSpacedDigit(let size, let weight):
            instanceFont = UIFont.monospacedDigitSystemFont(ofSize: CGFloat(size),
                                                            weight: CGFloat(weight))
        }
        return instanceFont
    }
}
