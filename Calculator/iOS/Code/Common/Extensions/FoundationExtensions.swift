//
//  FoundationExtensions.swift
//  Calculator
//
//  Created by Saurabh Dhingra on 15/09/24.
//

import Foundation

extension Double {
    func clean(places : Int) -> String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(format : "%.\(places)f", self)
    }
}
