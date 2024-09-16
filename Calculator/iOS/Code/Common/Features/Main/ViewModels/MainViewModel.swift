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

    }

    func set(operation: Operations){

    }

    func addOperation(operation: Operations){

    }

    func performAction(for pad: DialPad){

    }

    func reset(){
        
    }
}

