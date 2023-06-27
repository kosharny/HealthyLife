//
//  CalculatorViewResult.swift
//  HealthyLife
//
//  Created by Maksim Kosharny on 05.06.2023.
//

import SwiftUI

struct CalculatorViewResult: View {
    
    @Environment(\.presentationMode) var presentationMode
    let calorie: Int
    let speedResult: Int
    let lightResult: Int

    
    var body: some View {
        
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(stops: [
                    .init(color: Color("mainBgColor"), location: 0),
                    .init(color: Color("gradientColor2"), location: 0.5)
                ]), startPoint: .top, endPoint: .bottom)
                VStack {
                    ScrollView {
                        Text("КАЛЬКУЛЯТОР")
                            .font(Font.custom("monserat", size: 32))
                            .foregroundColor(Color("text2color"))
                        Text("КАЛОРИЙ")
                            .font(Font.custom("monserat", size: 32))
                            .foregroundColor(Color("text2color"))
                        optionView
                        tableDiet
                        Spacer()
                        
                    }
                    .padding(.top, UIScreen.main.bounds.height/20)
                }
            }
            .ignoresSafeArea()
        }
        .navigationBarItems(leading: Button(action: {
            // Возврат на предыдущую View при нажатии кнопки "Назад" в навигационной панели
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(Color("text2color"))
        })
//        .navigationViewStyle(StackNavigationViewStyle())
//        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
    }
}

extension CalculatorViewResult {
    var optionView: some View {
        VStack {
            Text("Сколько нужно калорий в день, чтобы вес не менялся:")
                .multilineTextAlignment(.center)
                .font(Font.custom("monserat", size: 20))
                .foregroundColor(Color("text2color"))
                .padding(.top, 20)
            
            Text("\(calorie) ккал/день ")
                .multilineTextAlignment(.center)
                .font(Font.custom("monserat", size: 20))
                .foregroundColor(.black)
            
            Text("Сколько нужно калорий в день для похудения:")
                .multilineTextAlignment(.center)
                .font(Font.custom("monserat", size: 20))
                .foregroundColor(Color("text2color"))
                .padding(.top, 4)
            Text("\(lightResult) ккал/день ")
                .multilineTextAlignment(.center)
                .font(Font.custom("monserat", size: 20))
                .foregroundColor(.black)
            
            Text(" Сколько нужно калорий в день, чтобы похудеть быстро:")
                .multilineTextAlignment(.center)
                .font(Font.custom("monserat", size: 20))
                .foregroundColor(Color("text2color"))
                .padding(.top, 4)
            Text("\(speedResult) ккал/день ")
                .multilineTextAlignment(.center)
                .font(Font.custom("monserat", size: 20))
                .foregroundColor(.black)
            
            Text("Диета:")
                .multilineTextAlignment(.center)
                .font(Font.custom("monserat", size: 26))
                .foregroundColor(.black)
                .padding(.top, 20)
            
        }
        .padding()
    }
    
    var tableDiet: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .border(Color.black, width: 1)
                        .foregroundColor(.clear)
                        .frame(width: UIScreen.main.bounds.width/7,height: UIScreen.main.bounds.height/20)
                    Text("")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("monserat", size: 26))
                        .foregroundColor(.black)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .border(Color.black, width: 1)
                        .foregroundColor(.clear)
                        .frame(height: UIScreen.main.bounds.height/20)
                    Text("Быстрая потеря веса")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("monserat", size: 12))
                        .foregroundColor(.black)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .border(Color.black, width: 1)
                        .foregroundColor(.clear)
                        .frame(height: UIScreen.main.bounds.height/20)
                    Text("Потеря веса")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("monserat", size: 12))
                        .foregroundColor(.black)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .border(Color.black, width: 1)
                        .foregroundColor(.clear)
                        .frame(height: UIScreen.main.bounds.height/20)
                    Text("Не изменяя вес")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("monserat", size: 12))
                        .foregroundColor(.black)
                }
            }
            
            HStack(spacing: 0) {
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .border(Color.black, width: 1)
                        .foregroundColor(.clear)
                        .frame(width: UIScreen.main.bounds.width/7,height: UIScreen.main.bounds.height/20)
                    Text("ПН")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("monserat", size: 18))
                        .foregroundColor(.black)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .border(Color.black, width: 1)
                        .foregroundColor(.clear)
                        .frame(height: UIScreen.main.bounds.height/20)
                    Text("\(speedResult)")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("monserat", size: 18))
                        .foregroundColor(.black)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .border(Color.black, width: 1)
                        .foregroundColor(.clear)
                        .frame(height: UIScreen.main.bounds.height/20)
                    Text("\(lightResult)")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("monserat", size: 18))
                        .foregroundColor(.black)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .border(Color.black, width: 1)
                        .foregroundColor(.clear)
                        .frame(height: UIScreen.main.bounds.height/20)
                    Text("\(calorie)")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("monserat", size: 18))
                        .foregroundColor(.black)
                }
            }
            
            HStack(spacing: 0) {
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .border(Color.black, width: 1)
                        .foregroundColor(.clear)
                        .frame(width: UIScreen.main.bounds.width/7,height: UIScreen.main.bounds.height/20)
                    Text("ВТ")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("monserat", size: 18))
                        .foregroundColor(.black)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .border(Color.black, width: 1)
                        .foregroundColor(.clear)
                        .frame(height: UIScreen.main.bounds.height/20)
                    Text("\(Int(Double(speedResult)*0.8))")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("monserat", size: 18))
                        .foregroundColor(.black)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .border(Color.black, width: 1)
                        .foregroundColor(.clear)
                        .frame(height: UIScreen.main.bounds.height/20)
                    Text("\(Int(Double(lightResult)*0.8))")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("monserat", size: 18))
                        .foregroundColor(.black)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .border(Color.black, width: 1)
                        .foregroundColor(.clear)
                        .frame(height: UIScreen.main.bounds.height/20)
                    Text("\(Int(Double(calorie)*0.8))")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("monserat", size: 18))
                        .foregroundColor(.black)
                }
            }
            
            HStack(spacing: 0) {
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .border(Color.black, width: 1)
                        .foregroundColor(.clear)
                        .frame(width: UIScreen.main.bounds.width/7,height: UIScreen.main.bounds.height/20)
                    Text("СР")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("monserat", size: 18))
                        .foregroundColor(.black)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .border(Color.black, width: 1)
                        .foregroundColor(.clear)
                        .frame(height: UIScreen.main.bounds.height/20)
                    Text("\(Int(Double(speedResult)*1.2))")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("monserat", size: 18))
                        .foregroundColor(.black)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .border(Color.black, width: 1)
                        .foregroundColor(.clear)
                        .frame(height: UIScreen.main.bounds.height/20)
                    Text("\(Int(Double(lightResult)*1.2))")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("monserat", size: 18))
                        .foregroundColor(.black)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .border(Color.black, width: 1)
                        .foregroundColor(.clear)
                        .frame(height: UIScreen.main.bounds.height/20)
                    Text("\(Int(Double(calorie)*1.2))")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("monserat", size: 18))
                        .foregroundColor(.black)
                }
            }
            
            HStack(spacing: 0) {
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .border(Color.black, width: 1)
                        .foregroundColor(.clear)
                        .frame(width: UIScreen.main.bounds.width/7,height: UIScreen.main.bounds.height/20)
                    Text("ЧТ")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("monserat", size: 18))
                        .foregroundColor(.black)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .border(Color.black, width: 1)
                        .foregroundColor(.clear)
                        .frame(height: UIScreen.main.bounds.height/20)
                    Text("\(speedResult)")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("monserat", size: 18))
                        .foregroundColor(.black)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .border(Color.black, width: 1)
                        .foregroundColor(.clear)
                        .frame(height: UIScreen.main.bounds.height/20)
                    Text("\(lightResult)")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("monserat", size: 18))
                        .foregroundColor(.black)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .border(Color.black, width: 1)
                        .foregroundColor(.clear)
                        .frame(height: UIScreen.main.bounds.height/20)
                    Text("\(calorie)")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("monserat", size: 18))
                        .foregroundColor(.black)
                }
            }
            
            HStack(spacing: 0) {
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .border(Color.black, width: 1)
                        .foregroundColor(.clear)
                        .frame(width: UIScreen.main.bounds.width/7,height: UIScreen.main.bounds.height/20)
                    Text("ПТ")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("monserat", size: 18))
                        .foregroundColor(.black)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .border(Color.black, width: 1)
                        .foregroundColor(.clear)
                        .frame(height: UIScreen.main.bounds.height/20)
                    Text("\(Int(Double(speedResult)*0.9))")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("monserat", size: 18))
                        .foregroundColor(.black)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .border(Color.black, width: 1)
                        .foregroundColor(.clear)
                        .frame(height: UIScreen.main.bounds.height/20)
                    Text("\(Int(Double(lightResult)*0.9))")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("monserat", size: 18))
                        .foregroundColor(.black)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .border(Color.black, width: 1)
                        .foregroundColor(.clear)
                        .frame(height: UIScreen.main.bounds.height/20)
                    Text("\(Int(Double(calorie)*0.9))")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("monserat", size: 18))
                        .foregroundColor(.black)
                }
            }
            
            HStack(spacing: 0) {
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .border(Color.black, width: 1)
                        .foregroundColor(.clear)
                        .frame(width: UIScreen.main.bounds.width/7,height: UIScreen.main.bounds.height/20)
                    Text("СБ")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("monserat", size: 18))
                        .foregroundColor(.black)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .border(Color.black, width: 1)
                        .foregroundColor(.clear)
                        .frame(height: UIScreen.main.bounds.height/20)
                    Text("\(Int(Double(speedResult)*1.1))")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("monserat", size: 18))
                        .foregroundColor(.black)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .border(Color.black, width: 1)
                        .foregroundColor(.clear)
                        .frame(height: UIScreen.main.bounds.height/20)
                    Text("\(Int(Double(lightResult)*1.1))")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("monserat", size: 18))
                        .foregroundColor(.black)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .border(Color.black, width: 1)
                        .foregroundColor(.clear)
                        .frame(height: UIScreen.main.bounds.height/20)
                    Text("\(Int(Double(calorie)*1.1))")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("monserat", size: 18))
                        .foregroundColor(.black)
                }
            }
            
            HStack(spacing: 0) {
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .border(Color.black, width: 1)
                        .foregroundColor(.clear)
                        .frame(width: UIScreen.main.bounds.width/7,height: UIScreen.main.bounds.height/20)
                    Text("ВС")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("monserat", size: 18))
                        .foregroundColor(.black)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .border(Color.black, width: 1)
                        .foregroundColor(.clear)
                        .frame(height: UIScreen.main.bounds.height/20)
                    Text("\(speedResult)")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("monserat", size: 18))
                        .foregroundColor(.black)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .border(Color.black, width: 1)
                        .foregroundColor(.clear)
                        .frame(height: UIScreen.main.bounds.height/20)
                    Text("\(lightResult)")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("monserat", size: 18))
                        .foregroundColor(.black)
                }
                ZStack {
                    RoundedRectangle(cornerRadius: 0)
                        .border(Color.black, width: 1)
                        .foregroundColor(.clear)
                        .frame(height: UIScreen.main.bounds.height/20)
                    Text("\(calorie)")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("monserat", size: 18))
                        .foregroundColor(.black)
                }
            }
        }
        .padding()
        .padding(.bottom, 80)
    }
}
