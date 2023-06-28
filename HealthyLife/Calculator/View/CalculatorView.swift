//
//  CalculatorView.swift
//  HealthyLife
//
//  Created by Maksim Kosharny on 01.06.2023.
//

import SwiftUI

struct CalculatorView: View {
    
    
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var viewModel = CalculatorViewModel()
    let impactGenerator = UIImpactFeedbackGenerator(style: .rigid)
    @State var calorie = 0
    @State var speedResult = 0
    @State var lightResult = 0
    @State private var isCalculatorResult = false
    @State private var age = ""
    @State private var gender = ""
    @State private var height = ""
    @State private var weight = ""
    @State private var activityLavel = ""
    @State private var desiredWeight = ""
    let genderFilter = ["Мужской", "Женский"]
    let activityLavelFilter = ["Основной обмен", "минимум/отсутсвие физической активности", "3 раза в неделю", "5 раз в неделю", "5 раз в неделю (интенсивно)", "Каждый день", "Каждый день интенсивно или 2 раза в день", "Ежедневная физическая нагрузка+физическая работа"]
    
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(stops: [
                    .init(color: Color("mainBgColor"), location: 0),
                    .init(color: Color("gradientColor2"), location: 0.5)
                ]), startPoint: .top, endPoint: .bottom)
                VStack {
                    Text("КАЛЬКУЛЯТОР")
                        .font(Font.custom("monserat", size: 32))
                        .foregroundColor(Color("text2color"))
                    Text("КАЛОРИЙ")
                        .font(Font.custom("monserat", size: 32))
                        .foregroundColor(Color("text2color"))
                    optionView
                    Spacer()
                    
                }
                .padding(.top, UIScreen.main.bounds.height/20)
            }
            .ignoresSafeArea()
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden()
    }
}

//struct CalculatorView_Previews: PreviewProvider {
//    static var previews: some View {
//        CalculatorView()
//    }
//}

extension CalculatorView {
    var optionView: some View {
        VStack {
            HStack {
                Text("Ваш возраст:")
                    .font(Font.custom("monserat", size: 20))
                    .foregroundColor(Color("text2color"))
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width/4 ,height: UIScreen.main.bounds.height/22)
                        .shadow(radius: 8)
                    TextField("", text: $age)
                        .keyboardType(.numberPad)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width/4 ,height: UIScreen.main.bounds.height/22)
                        .font(Font.custom("monserat", size: 26))
                        .foregroundColor(.black)
                }
                .padding(.trailing, 90)
            }
            .padding(.top, 30)
            .padding(.horizontal, 30)
            
            HStack {
                Text("Ваш пол:")
                    .font(Font.custom("monserat", size: 20))
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
                            .foregroundColor(.white)
                            .frame(width: UIScreen.main.bounds.width/2.5, height: UIScreen.main.bounds.height/22)
                            .shadow(radius: 8)
                        Text(gender.localized())
                            .font(Font.custom("monserat", size: 20))
                            .foregroundColor(.black)
                        
                        
                    }
                    .padding(.trailing, 40)
                    
                }
                
            }
            .padding(.top, 8)
            .padding(.horizontal, 30)
            
            
            
            HStack {
                Text("Ваш рост:")
                    .font(Font.custom("monserat", size: 20))
                    .foregroundColor(Color("text2color"))
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.height/22)
                        .shadow(radius: 8)
                    TextField("", text: $height)
                        .keyboardType(.numberPad)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width/4 ,height: UIScreen.main.bounds.height/22)
                        .font(Font.custom("monserat", size: 26))
                        .foregroundColor(.black)
                }
                .padding(.trailing, 90)
            }
            .padding(.top, 8)
            .padding(.horizontal, 30)
            
            HStack {
                Text("Ваш вес:")
                    .font(Font.custom("monserat", size: 20))
                    .foregroundColor(Color("text2color"))
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.height/22)
                        .shadow(radius: 8)
                    TextField("", text: $weight)
                        .keyboardType(.numberPad)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width/4 ,height: UIScreen.main.bounds.height/22)
                        .font(Font.custom("monserat", size: 26))
                        .foregroundColor(.black)
                }
                .padding(.trailing, 90)
            }
            .padding(.top, 8)
            .padding(.horizontal, 30)
            
            HStack {
                VStack {
                    HStack {
                        Text("Ваш уровень активности:")
                            .font(Font.custom("monserat", size: 20))
                            .foregroundColor(Color("text2color"))
                        Spacer()
                    }
                    .padding(.vertical, 8)
                    Menu {
                        ZStack {
                            ForEach(activityLavelFilter, id: \.self) { option in
                                Button {
                                    self.activityLavel = option
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
                                .foregroundColor(.white)
                                .frame(height: UIScreen.main.bounds.height/22)
                                .shadow(radius: 8)
                            //                            TextField("", text: $activityLavel)
                            //                                .padding()
                            //                                .frame(height: UIScreen.main.bounds.height/22)
                            //                                .font(Font.custom("monserat", size: 16))
                            //                                .foregroundColor(.black)
                            
                            Text(activityLavel.localized())
                                .font(Font.custom("monserat", size: 20))
                                .foregroundColor(.black)
                        }
                    }
                }
            }
            .padding(.top, 8)
            .padding(.horizontal, 30)
            
            HStack {
                Text("Ваш желаймый вес:")
                    .font(Font.custom("monserat", size: 20))
                    .foregroundColor(Color("text2color"))
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.height/22)
                        .shadow(radius: 8)
                    TextField("", text: $desiredWeight)
                        .keyboardType(.numberPad)
                        .padding()
                        .frame(width: UIScreen.main.bounds.width/4, height: UIScreen.main.bounds.height/22)
                        .font(Font.custom("monserat", size: 26))
                        .foregroundColor(.black)
                }
                .padding(.trailing, 50)
            }
            .padding(.top, 8)
            .padding(.horizontal, 30)
            
            Button {
                //                viewModel.calorieCalculator(gender: gender, weight: Double(weight) ?? 0.0, height: Double(height) ?? 0.0, age: Double(age) ?? 0.0, activity: activityLavel)
                viewModel.calorieCalculator(gender: gender, weight: Double(weight) ?? 0.0, height: Double(height) ?? 0.0, age: Double(age) ?? 0.0, activity: activityLavel)
                
                calorie = viewModel.calorieCalculatorView(gender: gender, weight: Double(weight) ?? 0.0, height: Double(height) ?? 0.0, age: Double(age) ?? 0.0, activity: activityLavel)
                speedResult = Int(Double(calorie) * 0.6)
                lightResult = Int(Double(calorie) * 0.8)
                isCalculatorResult.toggle()
            } label: {
                ZStack {
                    Circle()
                        .frame(width: UIScreen.main.bounds.width/3.5, height: UIScreen.main.bounds.width/3.5)
                        .foregroundColor(Color("buttonColor"))
                        .shadow(radius: 8)
                    Text("ВПЕРЕД!")
                        .font(Font.custom("monserat", size: 22)).bold()
                        .foregroundColor(.white)
                }
                .padding(.top, 20)
            }
            .navigationDestination(isPresented: $isCalculatorResult) {
                
                CalculatorViewResult(calorie: calorie, speedResult: speedResult, lightResult: lightResult)
            }
        }
    }
}
