//
//  SettingView.swift
//  HealthyLife
//
//  Created by Maksim Kosharny on 09.07.2023.
//

import SwiftUI

struct SettingView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    let genderFilter = ["English", "Русский"]
    @State private var gender = "Русский"
    @State private var name = ""
    
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
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width*0.95, height: UIScreen.main.bounds.height/16)
                        .shadow(radius: 16)
                    HStack {
                        Text("Язык:")
                            .font(Font.custom("monserat", size: 22))
                            .foregroundColor(Color("text2color"))
                        Spacer()
                        
                        Menu {
                            ZStack {
                                ForEach(genderFilter, id: \.self) { option in
                                    Button {
                                        self.gender = option
                                    } label: {
                                        Text(option.localized())
                                    }
                                }
                            }
                            .foregroundColor(.black)
                            .menuStyle(BorderlessButtonMenuStyle())
                            .padding()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color("text2color"), lineWidth: 1)
                                    .foregroundColor(.white)
                                    .frame(width: UIScreen.main.bounds.width/3.5, height: UIScreen.main.bounds.height/24)
//                                    .shadow(radius: 8)
                                Text(gender.localized())
                                    .font(Font.custom("monserat", size: 20))
                                    .foregroundColor(Color("text2color"))
                                
                                
                            }
//                            .padding(.horizontal, 40)
                            
                        }
                        
                    }
//                    .padding(.top, 8)
                    .padding(.horizontal, 50)
                }
                .padding(.top, 60)
                
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
                            TextField("Ладик", text: $name)
                                .font(Font.custom("monserat", size: 20))
                                .foregroundColor(Color("text2color"))
                                .frame(width: UIScreen.main.bounds.width/5, height: UIScreen.main.bounds.height/24)
                        }
                        
                    }
//                    .padding(.top, 8)
                    .padding(.horizontal, 50)
                }
                .padding(.top)
                
                Button {
                    //delete account
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
            // Возврат на предыдущую View при нажатии кнопки "Назад" в навигационной панели
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
