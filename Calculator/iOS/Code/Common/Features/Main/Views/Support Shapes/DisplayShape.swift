//
//  DisplayShape.swift
//  Calculator
//
//  Created by Saurabh Dhingra on 15/09/24.
//

import SwiftUI

struct DisplayShape: Shape{
    func path(in rect: CGRect) -> Path {
        
        let cX: CGFloat = rect.midX
        let cY: CGFloat = rect.midY
    
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: cY * 2))
        path.addLine(to: CGPoint(x: cX * 2, y: cY * 2))
        path.addLine(to: CGPoint(x: cX * 2, y: 0))
        path.addLine(to: CGPoint(x: cX / 2 - 40, y: 0))
        
        path.addLine(to: CGPoint(x: 0, y: cY - 62))
        // close the Path to make it a complete filled shape
        path.closeSubpath()
        return path
    }
}

struct DisplayShape_Previews: PreviewProvider {
    static var previews: some View{
        DisplayShape().stroke(lineWidth: 2).padding(12).frame(height: 240)
    }
}
