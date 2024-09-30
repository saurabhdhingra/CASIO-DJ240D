//
//  MainViewViewModel.swift
//  Calculator
//
//  Created by Saurabh Dhingra on 15/09/24.
//

import SwiftUI

class MainViewModel : ObservableObject {

    @Published var result = ""
    @Published var resultReady = false

    let operations = "+-*/%"
    
    var currentOperation: Operations = .unknown
    
    let maxCalculatorInputLimit = 10
    

    func calculate() { 
        guard(!operations.contains(result.suffix(1))) else { return }
        
        let expression: NSExpression = NSExpression(format: result)
        guard let computedValue: Double = expression.expressionValue(with: nil, context: nil) as? Double else { return }
        
        self.result = computedValue.clean(places: 3)
        
        self.currentOperation = .unknown
        
        self.resultReady = true
    }

    func set(operation: Operations){
        switch operation {
        case .plusMinus:
            guard let input = Double(result) else { return }
            
            self.result = (-input).clean(places: 3)
            self.currentOperation = .unknown
        case .percentage:
            guard let input = Double(result) else { return }
            
            self.result = (input * 0.01).clean(places: 3)
            self.currentOperation = .unknown
        default:
            break
        }
    }

    func addOperation(operation: Operations){
        
        
        if(currentOperation != .unknown){
            if operations.contains(result.suffix(1)) {
                self.result.removeLast()
                
                result += operation.rawValue
                self.currentOperation = operation
                return
            }
            
            calculate()
        }
        
        result += operation.rawValue
        self.currentOperation = operation
    }

    func performAction(for pad: DialPad){
        switch pad {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
            
            guard (!resultReady || currentOperation != .unknown) else { return }
            
            guard result.count <= maxCalculatorInputLimit else { return }
            
            self.result += pad.rawValue
        case .clear:
            reset()
            
        case .plusMinus:
            self.set(operation: .plusMinus)
        
        case .percentage:
            self.set(operation: .percentage)
            
        case .divide:
            self.addOperation(operation: .divide)
        
        case .multiply:
            self.addOperation(operation: .multiply)
        
        case .subtract:
            self.addOperation(operation: .minus)
        
        case .plus:
            self.addOperation(operation: .plus)
        
        case .decimal:
            guard result.count <= maxCalculatorInputLimit, !result.contains(".") else { return }
            self.result += pad.rawValue
        
        case .revert:
            self.reset()
            
        case .equal:
            self.calculate()
        }
    }

    func reset(){
        self.result = ""
        self.currentOperation = .unknown
        self.resultReady = false
    }
}

