//
//  WaterControlView.swift
//  HealthyLife
//
//  Created by Maksim Kosharny on 01.07.2023.
//

import SwiftUI

struct WaterControlView: View {
    
    let impactGenerator = UIImpactFeedbackGenerator(style: .rigid)
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var waterNeeded: Decimal = 2.5
    @State private var waterProcent: Decimal = 0.0
    @State private var water: Decimal = 0.1
    
    @ObservedObject var waterControlViewModel = WaterControlViewModel()
    @State private var drunkWater: Decimal = 0
       
    
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
                    if waterProcent <= 0.2 {
                        
                    } else if waterProcent <= 0.5 {
                        Image("water")
                            .padding(.top, 120)
                    } else if waterProcent <= 0.75 {
                        Image("water")
                            .padding(.top, 120)
                        Image("50waterdrunk")
                            .padding(.top, 20)
                    } else if waterProcent <= 0.9 {
                        Image("water")
                            .padding(.top, 120)
                        Image("50waterdrunk")
                            .padding(.top, 20)
                        Image("75waterdrunk")
                            .padding(.top, -60)
                    } else {
                        Image("water")
                            .padding(.top, 120)
                        Image("50waterdrunk")
                            .padding(.top, 20)
                        Image("75waterdrunk")
                            .padding(.top, -60)
                        Image("100waterdrunk")
                            .padding(.top, -125)
                    }
                    
                    HStack(spacing: 0) {
                        Text(drunkWater.description)
                            .font(Font.custom("monserat", size: 56))
                            .foregroundColor(.white)
                            .shadow(radius: 16)
                        Text(" л")
                            .font(Font.custom("monserat", size: 56))
                            .foregroundColor(.white)
                            .shadow(radius: 16)
                    }
                    .padding(.top, 60)
                   
                }
                
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .frame(width: UIScreen.main.bounds.width*0.75 ,height: UIScreen.main.bounds.height/9)
                        .foregroundColor(.white)
                        .shadow(radius: 16)
                    if viewModel.userSession != nil && viewModel.currenUser?.waterNeeded != 0.0 {
                        VStack {
                            HStack{
                                Text("Вам нужно выпивать ")
//                                    .padding()
                                //                                .frame(width: UIScreen.main.bounds.width*0.75 ,height: UIScreen.main.bounds.height/9)
                                    .multilineTextAlignment(.center)
                                    .font(Font.custom("monserat", size: 20))
                                    .foregroundColor(Color("text2color"))
                                Text(viewModel.currenUser!.waterNeeded.description)
//                                    .padding()
                                //                                .frame(width: UIScreen.main.bounds.width*0.75 ,height: UIScreen.main.bounds.height/9)
                                    .multilineTextAlignment(.center)
                                    .font(Font.custom("monserat", size: 20))
                                    .foregroundColor(Color("text2color"))
                               
                            }
                            Text("л воды в день")
//                                .padding()
                            //                                .frame(width: UIScreen.main.bounds.width*0.75 ,height: UIScreen.main.bounds.height/9)
                                .multilineTextAlignment(.center)
                                .font(Font.custom("monserat", size: 20))
                                .foregroundColor(Color("text2color"))
                        }
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
                        withAnimation(Animation.linear) {
                            impactGenerator.impactOccurred()
                        }
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
                        HStack(spacing: 0) {
                            Text(water.description)
                                .multilineTextAlignment(.center)
                                .font(Font.custom("monserat", size: 32))
                                .foregroundColor(Color("text2color"))
                            Text(" л")
                                .multilineTextAlignment(.center)
                                .font(Font.custom("monserat", size: 32))
                                .foregroundColor(Color("text2color"))
                        }
                    }
                    
                    Spacer()
                    
                    Button {
                        water += 0.1
                        withAnimation(Animation.linear) {
                            impactGenerator.impactOccurred()
                        }
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
                HStack {
                    Button {
                        withAnimation(Animation.linear) {
                            waterControlViewModel.resetDrunkWaterValueInFirestoreCollection()
                            waterProcent = 0
                            drunkWater = 0
                            impactGenerator.impactOccurred()
                        }
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 16)
                                .frame(width: UIScreen.main.bounds.width*0.17, height: UIScreen.main.bounds.height/15)
                                .foregroundColor(.red)
                                .shadow(radius: 16)
                            Image(systemName: "gobackward")
                                .foregroundColor(.white)
                            
                        }
                    }

                
                Button {
                    drunkWater = drunkWater + water
                    waterControlViewModel.updateValueInFirestoreCollection(drunkWater: drunkWater)
                    water = 0.1
                    if viewModel.userSession != nil && viewModel.currenUser?.waterNeeded != 0.0 {
                        waterNeeded = viewModel.currenUser!.waterNeeded
                    }
                    withAnimation(Animation.linear) {
                        waterProcent = drunkWater/waterNeeded
                        impactGenerator.impactOccurred()
                    }
                    print("\(drunkWater)")
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: UIScreen.main.bounds.width*0.6, height: UIScreen.main.bounds.height/15)
                            .foregroundColor(Color("waterBt"))
                            .shadow(radius: 16)
                        Text("ВЫПИТЬ!")
                            .multilineTextAlignment(.center)
                            .font(Font.custom("monserat", size: 40))
                            .foregroundColor(.white)
                        
                    }
                }
            }
                Spacer()
            }
        }
        .onAppear {
            drunkWater = viewModel.currenUser?.drunkWater ?? 0
            if viewModel.userSession != nil && viewModel.currenUser?.waterNeeded != 0.0 {
                waterNeeded = viewModel.currenUser!.waterNeeded
            }
            waterProcent = drunkWater/waterNeeded
        }
    }
}

struct WaterControlView_Previews: PreviewProvider {
    static var previews: some View {
        WaterControlView()
    }
}
