//
//  MotionAnimationBackground.swift
//  TeenFinance
//
//  Created by MACBOOK PRO on 02/05/24.
//

import SwiftUI

struct MotionAnimationBackground: View {
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating: Bool = false
    
    //Mark: - FUNCTIONS
    //Random size
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 10...300))
    }
    
    //random scale
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    //random speed
    func randomSpeed() -> Double{
        return Double.random(in: 0.025...1)
    }
    
    //random delay
    func randomDelay() -> Double{
        return Double.random(in: 0...2)
    }
    
    //random coordinat
    func randomCoordinate(max: CGFloat) -> CGFloat{
        return CGFloat.random(in: 0...max)
    }
    func randomColor() -> Color{
        let red = Double.random(in: 0..<1)
                let green = Double.random(in: 0..<1)
                let blue = Double.random(in: 0..<1)
                // Mengembalikan warna acak yang dihasilkan
                return Color(red: red, green: green, blue: blue)
    }
    
    var body: some View {
        GeometryReader{
            geometry in
            ZStack{
                ForEach(0...randomCircle, id: \.self){
                    item in
                    Rectangle()
                        .foregroundStyle(randomColor())
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(
                            x: randomCoordinate(max: geometry.size.width),
                            y: randomCoordinate(max: geometry.size.height)
                        )
                        .animation(Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay()),
                            value: isAnimating)
                        .onAppear{
                            isAnimating = true
                        }
                }
            }
            .drawingGroup()
            .ignoresSafeArea()
        }
    }
}
#Preview {
    MotionAnimationBackground()
}
