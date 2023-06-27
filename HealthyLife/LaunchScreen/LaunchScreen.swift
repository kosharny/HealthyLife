//
//  LaunchScreen.swift
//  HealthyLife
//
//  Created by Maksim Kosharny on 01.06.2023.
//

import SwiftUI

struct LaunchScreen: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    @State private var offsetHealthy: CGFloat = -120
    @State private var offsetLife: CGFloat = 120
    let impactGenerator = UIImpactFeedbackGenerator(style: .heavy)
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            ZStack {
                Color(.white)
                VStack {
                    Image("launchLogo")
                    HStack{
                        Text("Healthy")
                            .padding(.top)
                            .font(Font.custom("paprika", size: 40))
                            .foregroundColor(Color("mainBgColor"))
                            .offset(x: offsetHealthy, y: 0)
                        
                        Text("Life")
                            .padding(.top)
                            .font(Font.custom("paprika", size: 40))
                            .foregroundColor(Color("mainBgColor"))
                            .offset(x: offsetLife, y: 0)
                    }
                    .onAppear {
                        withAnimation(.easeIn(duration: 1.3)) {
                            self.offsetLife = 0
                            self.offsetHealthy = 0
                        }
                    }
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.3)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .ignoresSafeArea()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                    withAnimation {
                        self.isActive = true
                        impactGenerator.impactOccurred()
                    }
                }
            }
        }
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}

