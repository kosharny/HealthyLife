//
//  ContentView.swift
//  HealthyLife
//
//  Created by Maksim Kosharny on 01.06.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedIndex: Tab = .main
    @EnvironmentObject var viewModel: AuthViewModel
    var post = PostInfo(imageName: "", titleName: "", titleNameEn: "")
    let impactGenerator = UIImpactFeedbackGenerator(style: .medium)
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
                customTab
                .padding(.top, UIScreen.main.bounds.height/7.9)
            VStack{
                headerView
                Spacer()
            }
            
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    
    var headerView: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .shadow(radius: 6)
            VStack {
                Spacer()
                HStack {
                    Image("mainLogo")
                    Text("Healthy Life")
                        .padding(.top, 2)
                        .font(Font.custom("paprika", size: 30))
                        .foregroundColor(Color("mainBgColor"))
                }
                .padding(.bottom, 12)
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/8)
    }
    
    
    var customTab: some View {
        
        ZStack {
            VStack {
                    TabView(selection: $selectedIndex) {
                        ForEach(Tab.allCases, id: \.rawValue) { tab in
                            HStack {
                                switch selectedIndex {
                                case .main:
                                        MainMenuView()
                                case .calculator:
//                                    CalculatorView()
                                    SelectTheDesiredWindowCalculateView()
                                case .raindrop:
                                        WaterControlView()
                                case .account:
                                        SelectTheDesiredWindowView()
//                                    Group {
//                                        // no user logged in
//
//                                        if viewModel.userSession == nil {
//                                            SignInView()
//                                        } else {
//                                            // have a logged in user
//                                            AccountView()
//                                        }
//                                    }
                                }
                            }
                            .tag(tab)
                        }
                    }
                    .onChange(of: selectedIndex) { value in
                        impactGenerator.impactOccurred()
                    }
                
            }
            VStack {
                Spacer()
                CustomTabBar(selectedIndex: $selectedIndex)
                    .padding(.bottom, 24)
            }
        }
    }
}
