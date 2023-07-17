//
//  OnBoardingView.swift
//  FlipSide
//
//  Created by Desi Rorie on 7/10/23.
//

import SwiftUI

struct OnBoardingView: View {
    @State private var isAnimating:Bool = false
    @AppStorage("isOnboarding") private var isOnboarding:Bool?
    @Environment(\.colorScheme) private var colorScheme
    var body: some View {
        ZStack {
            VStack{
                Spacer()
                Text("FlipSide")
                    .font(.title)
                    .fontDesign(.serif)
                
                Rectangle()
                    .foregroundColor(isAnimating ? Color("OnboardingColor") : colorScheme == .dark ? Color.black : Color.white)
                    .frame(width: 150, height: 200)
                    .cornerRadius(10)
                    .rotation3DEffect(
                                           .degrees(isAnimating ? 180 : 0), // Rotate 180 degrees when animating
                                           axis: (x: 0.0, y: 1.0, z: 0.0) // Rotate around the Y-axis
                                       )
                    .animation(.easeOut(duration: 2), value: isAnimating)
                    .onAppear{
                        withAnimation {
                            isAnimating = true
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                         isOnboarding = false
                        }
                    }
                
                Spacer()
                    
            }
        }.preferredColorScheme(colorScheme)
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
