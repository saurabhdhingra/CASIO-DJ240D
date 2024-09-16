//
//  FontManager.swift
//  Calculator
//
//  Created by Saurabh Dhingra on 15/09/24.
//

import SwiftUI

enum TypefaceOne {
    case regular
    
    func font(size : CGFloat) -> Font {
        switch self {
        case .regular :
            return .custom("BuneeLayers-Regular", size: size)
        }
    }
}
