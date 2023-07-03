//
//  WaterControlView.swift
//  HealthyLife
//
//  Created by Maksim Kosharny on 01.07.2023.
//

import SwiftUI

struct WaterControlView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var waterNeeded: Decimal = 0.0
    @State private var water: Decimal = 0.1
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(stops: [
                .init(color: Color(.white), location: 0),
                .init(color: Color("waterBgColor"), location: 0.5),
                .init(color: Color(.white), location: 1)
            ]), startPoint: .top, endPoint: .bottom)
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: UIScreen.main.bounds.width*0.65, height: UIScreen.main.bounds.width/5)
                        .foregroundColor(.white)
                        .shadow(radius: 16)
                    VStack {
                        Text("КОНТРОЛЬ")
                            .font(Font.custom("monserat", size: 32))
                            .foregroundColor(Color("text2color"))
                        Text("ВОДЫ")
                            .font(Font.custom("monserat", size: 32))
                            .foregroundColor(Color("text2color"))
                    }
                }
                .padding(.top, 16)
                ZStack {
                    Image("waterControlBg")
                    Image("waterControl")
                        .shadow(radius: 16)
                    Image("water")
                        .padding(.top, 120)
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: UIScreen.main.bounds.width*0.75 ,height: UIScreen.main.bounds.height/9)
                        .foregroundColor(.white)
                        .shadow(radius: 16)
                    if viewModel.userSession != nil && viewModel.currenUser?.waterNeeded != 0.0 {
                        Text("Вам нужно выпивать " + "\(viewModel.currenUser!.waterNeeded)" + "л воды в день")
                            .padding()
                            .frame(width: UIScreen.main.bounds.width*0.75 ,height: UIScreen.main.bounds.height/9)
                            .multilineTextAlignment(.center)
                            .font(Font.custom("monserat", size: 20))
                            .foregroundColor(Color("text2color"))
                    } else {
                        Text("Среднестатистическому человеку нужно пить 2.5 л воды в день")
                            .padding()
                            .frame(width: UIScreen.main.bounds.width*0.75 ,height: UIScreen.main.bounds.height/9)
                            .multilineTextAlignment(.center)
                            .font(Font.custom("monserat", size: 20))
                            .foregroundColor(Color("text2color"))
                    }
                }
                HStack {
                    Button {
                        water -= 0.1
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: UIScreen.main.bounds.width*0.15, height: UIScreen.main.bounds.width*0.15)
                                .foregroundColor(.white)
                                .shadow(radius: 16)
                            Text("-")
                                .multilineTextAlignment(.center)
                                .font(Font.custom("monserat", size: 54))
                                .foregroundColor(Color("text2color"))
                        }
                    }
                    .padding(.leading, 35)
                    
                    Spacer()
                    
                    ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(width: UIScreen.main.bounds.width*0.3,height: UIScreen.main.bounds.height/13)
                                .foregroundColor(.white)
                                .shadow(radius: 16)
                        Text("\(water)" + " л")
                            .multilineTextAlignment(.center)
                            .font(Font.custom("monserat", size: 32))
                            .foregroundColor(Color("text2color"))
                    }

                    Spacer()
                    
                    Button {
                        water += 0.1
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: UIScreen.main.bounds.width*0.15, height: UIScreen.main.bounds.width*0.15)
                                .foregroundColor(.white)
                                .shadow(radius: 16)
                            Text("+")
                                .multilineTextAlignment(.center)
                                .font(Font.custom("monserat", size: 44))
                                .foregroundColor(Color("text2color"))
                        }
                        .padding(.trailing, 35)
                    }
                }
                
                Button {
                    waterNeeded = waterNeeded + water
                    water = 0.1
                    print("\(waterNeeded)")
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: UIScreen.main.bounds.width*0.7, height: UIScreen.main.bounds.height/12)
                            .foregroundColor(Color("waterBt"))
                            .shadow(radius: 16)
                        Text("ВЫПИТЬ!")
                            .multilineTextAlignment(.center)
                            .font(Font.custom("monserat", size: 40))
                            .foregroundColor(.white)
                        
                    }
                }

                Spacer()
            }
        }
    }
}

struct WaterControlView_Previews: PreviewProvider {
    static var previews: some View {
        WaterControlView()
    }
}
