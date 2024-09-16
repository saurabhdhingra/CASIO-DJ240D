//
//  SwiftUIView.swift
//  Calculator
//
//  Created by Saurabh Dhingra on 16/09/24.
//

import SwiftUI

struct CalculatorPad: View {

    @EnvironmentObject var mainViewModel: MainViewModel
    @Environment(\.colorScheme) var colorScheme: ColorScheme

    @State var scale: CGFloat = 1
    @State var foregroundColor = Color.white

    let animationDuration: TimeInterval = 0.15

    var dialPad: DialPad
    var color: Color = .label


    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .foregroundColor(mainViewModel.currentOperation.rawValue == dialPad.getOperator()
                && mainViewModel.currentOperation != .unknown ? color.opacity(0.2) :
                    .blue.opacity(0.055))
                .overlay {
                    Text(dialPad.rawValue)
                        .font(TypefaceOne.regular.font(size: 20))
                        .foregroundColor(color)
                }
                .scaleEffect(scale)
                .onTapGesture {
                    self.mainViewModel.performAction(for: dialPad)

                    withAnimation(.easeInOut(duration: animationDuration)){
                        scale = 0.95
                    }

                    Timer.scheduledTimer(withTimeInterval: animationDuration, repeats: false){ _ in
                        scale = 1
                    }
                }
    }
}

struct CalculatorPad_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorPad(dialPad: . seven)
            .environmentObject(MainViewModel())
            .frame(width: 70, height: 70)
    }
}
