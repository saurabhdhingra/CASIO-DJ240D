//
//  MainViewViewModel.swift
//  Calculator
//
//  Created by Saurabh Dhingra on 15/09/24.
//

import SwiftUI

class MainViewViewModel : ObservableObject {

    @Published var result = ""
    @Published var resultReady = false

    let operations = "+-*/%"
    

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

