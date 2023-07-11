//
//  SettingView.swift
//  HealthyLife
//
//  Created by Maksim Kosharny on 09.07.2023.
//

import SwiftUI

struct SettingView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var viewModel: AuthViewModel
    let langFilter = ["English", "Русский"]
    @State private var lang = "Русский"
    @State private var name = ""
    @State private var selectedLanguage = UserDefaults.standard.string(forKey: "selectedLanguage") ?? "en"
    
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    HStack(spacing: 0) {
                        Text("Настройки")
                            .font(Font.custom("monserat", size: 30).bold())
                            .foregroundColor(Color("text2color"))
                    }
                    .padding(.horizontal, 30)
                }
                
                Divider()
                    .overlay(Color("text2color"))

                Button {
                    if let url = URL(string: UIApplication.openSettingsURLString) {
                        UIApplication.shared.open(url)
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width*0.95, height: UIScreen.main.bounds.height/16)
                            .shadow(radius: 16)
                        
                        Text("Сменить язык")
                            .font(Font.custom("monserat", size: 22))
                            .foregroundColor(.blue)
                    }
                    .padding(.top)
                }
                .padding(.top)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width*0.95, height: UIScreen.main.bounds.height/16)
                        .shadow(radius: 16)
                    HStack {
                        Text("Имя пользователя")
                            .font(Font.custom("monserat", size: 20))
                            .foregroundColor(Color("text2color"))
                        Spacer()
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color("text2color"), lineWidth: 1)
                                .foregroundColor(.white)
                                .frame(width: UIScreen.main.bounds.width/3.5, height: UIScreen.main.bounds.height/24)
                            TextField(viewModel.currenUser?.name ?? "Имя не установлено", text: $name)
                                .font(Font.custom("monserat", size: 20))
                                .foregroundColor(Color("text2color"))
                                .frame(width: UIScreen.main.bounds.width/5, height: UIScreen.main.bounds.height/24)
                        }
                        Spacer()
                        
                        Button {
                            viewModel.updateValueInFirestoreCollection(name: name)
                        } label: {
                            Image(systemName: "checkmark.circle")
                                .foregroundColor(Color("text2color"))
                        }
                        
                        
                    }
                    .padding(.horizontal, 50)
                }
                .padding(.top)
                
                Button {
                    viewModel.delete()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width*0.95, height: UIScreen.main.bounds.height/16)
                            .shadow(radius: 16)
                        
                        Text("Удалить аккаунт")
                            .font(Font.custom("monserat", size: 22))
                            .foregroundColor(.red)
                    }
                    .padding(.top)
                }
                
                Spacer()
            }
        }
        .navigationBarItems(leading: Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(Color("text2color"))
        })
        .navigationBarBackButtonHidden()
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
