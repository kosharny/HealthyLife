//
//  RegisterView.swift
//  HealthyLife
//
//  Created by Maksim Kosharny on 06.06.2023.
//

import SwiftUI

struct RegisterView: View {
    @State private var name: String  = ""
    @State private var password: String  = ""
    @State private var email: String  = ""
    @State private var confirmPassword: String  = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Войдите в свой аккаунт!")
                    .font(Font.custom("monserat", size: 30).bold())
                    .foregroundColor(Color("text2color"))
                    .padding(.horizontal)
                
                Divider()
                    .overlay(Color("text2color"))
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(height: UIScreen.main.bounds.height/20)
                        .foregroundColor(Color("textFieldColor"))
                        .shadow(radius: 8)
                    TextField("Электронная почта", text: $email)
                        .autocapitalization(.none)
                        .font(Font.custom("monserat", size: 16).bold())
                        .foregroundColor(Color("text2color"))
                        .padding(.horizontal)
                }
                .padding(.top, 20)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(height: UIScreen.main.bounds.height/20)
                        .foregroundColor(Color("textFieldColor"))
                        .shadow(radius: 8)
                    TextField("Имя", text: $name)
                        .autocapitalization(.none)
                        .font(Font.custom("monserat", size: 16).bold())
                        .foregroundColor(Color("text2color"))
                        .padding(.horizontal)
                }
                .padding(.top, 16)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(height: UIScreen.main.bounds.height/20)
                        .foregroundColor(Color("textFieldColor"))
                        .shadow(radius: 8)
                    SecureField("Пароль", text: $password)
                        .autocapitalization(.none)
                        .font(Font.custom("monserat", size: 16).bold())
                        .foregroundColor(Color("text2color"))
                        .padding(.horizontal)
                }
                .padding(.top, 16)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(height: UIScreen.main.bounds.height/20)
                        .foregroundColor(Color("textFieldColor"))
                        .shadow(radius: 8)
                    SecureField("Подтвердите пароль", text: $confirmPassword)
                        .autocapitalization(.none)
                        .font(Font.custom("monserat", size: 16).bold())
                        .foregroundColor(Color("text2color"))
                        .padding(.horizontal)
                }
                .padding(.top, 16)
                
                
                Button {
                    if password == confirmPassword {
                        viewModel.register(withEmail: email, password: password, name: name)
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(height: UIScreen.main.bounds.height/20)
                            .foregroundColor(Color("mainBgColor"))
                            .shadow(radius: 8)
                        Text("Зарегистрироваться")
                            .font(Font.custom("monserat", size: 28).bold())
                            .foregroundColor(.white)
                            .padding(.horizontal)
                    }
                    .padding(.top, 25)
                }
                
                NavigationLink {
                    SignInView()
                } label: {
                    Text("У Вас уже есть аккаунт?")
                        .font(Font.custom("monserat", size: 14).bold())
                        .foregroundColor(.black)
                        .padding(.top, 4)
                }
                
                
            buttonSignIn
                Spacer()
                
                
            }
            .padding(.top, 20)
            .padding()
        }
        .navigationBarBackButtonHidden()
        .navigationBarHidden(true)
        .navigationDestination(isPresented: $viewModel.didAuthUser) {
            AccountView()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

extension RegisterView {
    var buttonSignIn: some View {
        VStack {
            Button {
                viewModel.signInWithGoogle()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(height: UIScreen.main.bounds.height/20)
                        .foregroundColor(.white)
                        .shadow(radius: 8)
                    HStack {
                        Text("Войти с помощью Google")
                            .font(Font.custom("monserat", size: 16).bold())
                            .foregroundColor(.black)
                            .padding(.horizontal)
                        
                        Spacer()
                        
                        Image("google")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width/14, height: UIScreen.main.bounds.width/14)
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 25)
            }
            
            
            Button {
                // signInWithFacebook
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(height: UIScreen.main.bounds.height/20)
                        .foregroundColor(Color("fbButton"))
                        .shadow(radius: 8)
                    HStack {
                        Text("Войти с помощью Facebook")
                            .font(Font.custom("monserat", size: 16).bold())
                            .foregroundColor(.white)
                            .padding(.horizontal)
                        
                        Spacer()
                        
                        Image("facebook")
                            .frame(width: UIScreen.main.bounds.width/14, height: UIScreen.main.bounds.width/14)
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 15)
            }
        }
    }
}
