//
//  LikeView.swift
//  HealthyLife
//
//  Created by Maksim Kosharny on 01.06.2023.
//

import SwiftUI

struct LikeView: View {
    @State private var showModal = false
    @ObservedObject var viewModel: LikeViewModel
    
    let impactGenerator = UIImpactFeedbackGenerator(style: .rigid)
    
    @Environment(\.presentationMode) var presentationMode
    
    init() {
        self.viewModel = LikeViewModel()
    }
   
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(viewModel.posts) { post in
                    Button {
                        withAnimation(Animation.linear) {
                            impactGenerator.impactOccurred()
                            showModal = true
                        }
                    } label: {
                            PostCell(post: PostInfo(imageName: post.imageName, titleName: post.titleName))
                    }
                    .sheet(isPresented: $showModal) {
                        PostView(post: PostInfo(imageName: post.imageName, textLabel: post.textLabel ?? "" , titleName: post.titleName))
                    }
                }
            }
            .padding(.top, 20)
            .padding(.bottom, 66)
            .scrollIndicators(.hidden)
        }
        .navigationBarItems(leading: Button(action: {
            // Возврат на предыдущую View при нажатии кнопки "Назад" в навигационной панели
            presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(Color("text2color"))
        })
        .navigationBarBackButtonHidden()
//        .navigationBarHidden(true)
    }
}

//struct LikeView_Previews: PreviewProvider {
//    static var previews: some View {
//        LikeView()
//    }
//}
