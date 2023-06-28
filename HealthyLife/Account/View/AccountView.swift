//
//  AccountView.swift
//  HealthyLife
//
//  Created by Maksim Kosharny on 01.06.2023.
//

import SwiftUI

struct AccountView: View {
    
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    let impactGenerator = UIImpactFeedbackGenerator(style: .rigid)
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    if let user = viewModel.currenUser {
                        HStack(spacing: 0) {
                            Text("Привет, ")
                                .font(Font.custom("monserat", size: 30).bold())
                                .foregroundColor(Color("text2color"))
                            Text("\(user.name)!")
                                .font(Font.custom("monserat", size: 30).bold())
                                .foregroundColor(Color("text2color"))
                        }
                        .padding(.horizontal)
                    }
                }
                
                Divider()
                    .overlay(Color("text2color"))
                
                NavigationLink {
                        LikeView()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(height: UIScreen.main.bounds.height/20)
                            .foregroundColor(.white)
                            .shadow(radius: 8)
                        HStack {
                            Text("Сохраненные")
                                .font(Font.custom("monserat", size: 20).bold())
                                .foregroundColor(Color("text2color"))
                                .padding(.horizontal)
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                    .padding(.top, 35)
                }
                
                NavigationLink {
                    SelectTheDesiredWindowCalculateView()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(height: UIScreen.main.bounds.height/20)
                            .foregroundColor(.white)
                            .shadow(radius: 8)
                        HStack {
                            Text("Ваша калорийность")
                                .font(Font.custom("monserat", size: 20).bold())
                                .foregroundColor(Color("text2color"))
                                .padding(.horizontal)
                            Spacer()
                        }
                        .padding(.horizontal)
                    }
                    .padding(.top, 25)
                }
                
                Spacer()
                    
                    Button {
                        withAnimation(Animation.linear) {
                            impactGenerator.impactOccurred()
                            viewModel.signOut()
                        }
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(height: UIScreen.main.bounds.height/20)
                                .foregroundColor(.red)
                                .shadow(radius: 8)
                                Text("Выйти")
                                    .font(Font.custom("monserat", size: 28).bold())
                                    .foregroundColor(.white)
                                    .padding(.horizontal)
                        }
                        .padding(.top, 25)
                        
                }
            }
            .padding(.top, 20)
            .padding(.bottom, 60)
            .padding()
        }
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
