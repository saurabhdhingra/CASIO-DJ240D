//
//  ContentView.swift
//  Calculator
//
//  Created by Saurabh Dhingra on 15/09/24.
//

import SwiftUI

struct MainView: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @StateObject var mainViewModel: MainViewModel = MainViewModel()
    
    let duration: TimeInterval = 0.3
    
    var body: some View {
        GeometryReader{ proxy in
            
            let height: CGFloat = proxy.size.height
            
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)){
                
                Color.background
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading, spacing: 28){
                    HStack{
                        VStack(alignment: .leading, spacing: 4){
                            Text("CASIO")
                                .font(.custom("EurostileExtended-Black", size: 26))
                            
                            Text("Calculator")
                                .tracking(1.2)
                                .font(.system(size: 20, weight: .medium, design: .monospaced))
                                .textCase(.uppercase)
                                .opacity(0.25)
                                .offset(x: 2)
                            
                        }
                        
                        Spacer()
                        
                        HStack(spacing: 4) {
                            ForEach(0 ..< 4) { _ in
                                Rectangle()
                                    .foregroundColor(.gray)
                                    .frame(width: 20, height: 20)
                                
                            }
                        }
                    }
                    DisplayView(height: height, colorScheme: colorScheme, duration: duration).environmentObject(mainViewModel).padding(.horizontal, -18)
                    
                    CalculatorButtons(stackSpacing: 20)
                        .environmentObject(mainViewModel)
                }
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
