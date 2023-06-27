//
//  PostView.swift
//  HealthyLife
//
//  Created by Maksim Kosharny on 02.06.2023.
//

import SwiftUI
import Kingfisher

struct PostView: View {
    
    
//    @ObservedObject var viewModel: LikeViewModel
    @State private var showAlert = false
    var post = PostInfo(imageName: "", titleName: "")
    let impactGenerator = UIImpactFeedbackGenerator(style: .rigid)
    
    
//    @Published var post: PostInfo
    let servise = PostServises()
    
//    init(post: PostInfo) {
//        self.viewModel = LikeViewModel(post: post)
//    }
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    KFImage(URL(string: post.imageName))
                    //                    .onProgress { receivedSize, totalSize in
                    //                                    if !self.isLoading {
                    //                                        self.isLoading = true
                    //                                    }
                    //                                }
                    //                                .placeholder {
                    //                                    if isLoading {
                    //                                        ProgressView()
                    //                                    } else {
                    //                                        Image(systemName: "photo")
                    //                                    }
                    //                                }
                        .resizable()
                        .scaledToFill()
                        .cornerRadius(16)
                    HStack {
                        Spacer()
                        Button {
                            //likeAction
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
                                    Text("Like!")
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


