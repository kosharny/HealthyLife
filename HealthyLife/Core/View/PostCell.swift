//
//  PostCell.swift
//  HealthyLife
//
//  Created by Maksim Kosharny on 02.06.2023.
//

import SwiftUI
import Kingfisher

struct PostCell: View {
    
    
    let width = UIScreen.main.bounds.width - 40
    let height = UIScreen.main.bounds.height / 2 - 130
    var post = PostInfo(imageName: "", titleName: "Двухслойная творожная запеканка", titleNameEn: "Двухслойная творожная запеканка")
    
    @State private var isLoading = false
    
    var body: some View {
        VStack {
            ZStack {
                VStack(spacing: 0) {
                    KFImage(URL(string: post.imageName))
                        .onProgress { receivedSize, totalSize in
                                        if !self.isLoading {
                                            self.isLoading = true
                                        }
                                    }
                                    .placeholder {
                                        if isLoading {
                                            ProgressView()
                                        } else {
                                            Image(systemName: "photo")
                                        }
                                    }
                        .resizable()
                    ZStack {
                        Rectangle()
                            .foregroundColor(.white)
                        Text(post.titleName)
                            .font(Font.custom("monserat", size: 20).bold())
                            .foregroundColor(Color("text2color"))
                    }
                    .frame(height: UIScreen.main.bounds.height/13.76)
                }
            }
            .cornerRadius(16)
            .shadow(radius: 4)
            .frame(width: UIScreen.main.bounds.width*0.9, height: UIScreen.main.bounds.height/3.44)
        }
        .padding(.bottom, 6)
        .frame(width: UIScreen.main.bounds.width)
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell()
    }
}
