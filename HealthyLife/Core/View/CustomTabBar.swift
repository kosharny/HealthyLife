//
//  CustomTabBar.swift
//  HealthyLife
//
//  Created by Maksim Kosharny on 01.06.2023.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case main
    case calculator
    case raindrop
    case account
}

struct CustomTabBar: View {
    @Binding var selectedIndex: Tab
    
    var body: some View {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    HStack {
                        Image("\(tab)")
                            .frame(width: 24, height: 24)
                            .scaleEffect(selectedIndex == tab ? 1.2 : 1.0)
                            .onTapGesture {
                                withAnimation(.easeIn(duration: 0.1)) {
                                    selectedIndex = tab
                                }
                            }
                        
                        //                        if tab != .account {
                        //                            Divider()
                        //                                .frame(width: 0.5)
                        //                                .overlay(Color("TextFooterColor"))
                        //                        }
                    }
                    //                    .frame(height: 50)
                    Spacer()
                }
            }
            .frame(width: UIScreen.main.bounds.width*0.91, height: UIScreen.main.bounds.width/6)
            .background(Color("mainBgColor"))
            .cornerRadius(16)
            .shadow(radius: 6)
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedIndex: .constant(.main))
    }
}
