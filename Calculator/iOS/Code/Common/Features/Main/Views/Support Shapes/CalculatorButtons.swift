//
//  CalculatorButtons.swift
//  Calculator
//
//  Created by Saurabh Dhingra on 28/09/24.
//

import SwiftUI

struct CalculatorButtons: View {
    
    @EnvironmentObject var mainViewModel: MainViewModel
    
    var stackSpacing: CGFloat = 0
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: stackSpacing - 4){
            HStack(spacing: stackSpacing){
                CalculatorPad(dialPad: .clear,  color: .teal)
                CalculatorPad(dialPad: .plusMinus, color: .teal)
                CalculatorPad(dialPad: .percentage, color: .teal)
                CalculatorPad(dialPad: .divide, color: .orange)
            }
            
            HStack(spacing: stackSpacing){
                CalculatorPad(dialPad: .seven)
                CalculatorPad(dialPad: .eight)
                CalculatorPad(dialPad: .nine)
                CalculatorPad(dialPad: .multiply, color: .orange)
            }
            
            HStack(spacing: stackSpacing){
                CalculatorPad(dialPad: .four)
                CalculatorPad(dialPad: .five)
                CalculatorPad(dialPad: .six)
                CalculatorPad(dialPad: .subtract, color: .orange)
            }
            
            HStack(spacing: stackSpacing){
                CalculatorPad(dialPad: .one)
                CalculatorPad(dialPad: .two)
                CalculatorPad(dialPad: .three)
                CalculatorPad(dialPad: .plus, color: .orange)
            }
            
            HStack(spacing: stackSpacing){
                CalculatorPad(dialPad: .zero)
                HStack(spacing: stackSpacing){
                    CalculatorPad(dialPad: .decimal)
                    CalculatorPad(dialPad: .equal, color: .orange)
                }
            }
        }
        .environmentObject(mainViewModel)
    }
}


struct CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButtons(stackSpacing: 24)
            .environmentObject(MainViewModel())
            .padding(24)
            .frame(height: 450)
    }
}
