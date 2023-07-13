//
//  PostView.swift
//  HealthyLife
//
//  Created by Maksim Kosharny on 02.06.2023.
//

import SwiftUI
import Kingfisher

struct PostView: View {
    
    @State private var showAlert = false
    var post = PostInfo(imageName: "", titleName: "", titleNameEn: "")
    let impactGenerator = UIImpactFeedbackGenerator(style: .rigid)
    let servise = PostServises()
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    
                    KFImage(URL(string: post.imageName))
                        .resizable()
                        .scaledToFill()
                        .cornerRadius(16)
                    HStack {
                        Spacer()
                        Button {
                            withAnimation(Animation.linear) {
                                impactGenerator.impactOccurred()
                                savePost(ad: post)
                                showAlert = true
                            }
                        } label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 16)
                                    .foregroundColor(Color("mainBgColor"))
                                    .frame(width: UIScreen.main.bounds.width/4 ,height: UIScreen.main.bounds.height/22)
                                    .shadow(radius: 4)
                                HStack {
                                    Image("like")
                                    Text("Save!")
                                        .font(Font.custom("monserat", size: 20))
                                        .foregroundColor(.white)
                                }
                            }
                        }
                    }
                    .padding()
                    
                    Text(post.titleName)
                        .font(Font.custom("monserat", size: 22))
                        .foregroundColor(Color("text2color"))
                    
                    Divider()
                        .overlay(Color("text2color"))
                    
                    
                    
                    Text(formatStringWithNewlines(post.textLabel ?? ""))
                        .padding(10)
                        .font(Font.custom("monserat", size: 19))
                        .foregroundColor(Color("text2color"))
                        .lineSpacing(6)
                    
                    
                    Divider()
                        .overlay(Color("text2color"))
                }
                .padding()
                
            }
            VStack {
                Spacer()
                AlertView(showPopUp: $showAlert)
            }
        }
    }
    
    func savePost(ad: PostInfo) {
        servise.savePost(titleName: ad.titleName, imageName: ad.imageName, textLabel: ad.textLabel ?? "") { success in
            if success {
//                post.isSave = true
            }
        }
    }
    
    func formatStringWithNewlines(_ inputString: String) -> String {
        let formattedString = inputString.replacingOccurrences(of: "\\n", with: "\n")
        return formattedString
    }

}


