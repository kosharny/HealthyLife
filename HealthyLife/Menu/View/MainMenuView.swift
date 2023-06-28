//
//  MainMenuView.swift
//  HealthyLife
//
//  Created by Maksim Kosharny on 01.06.2023.
//

import SwiftUI

struct MainMenuView: View {
    
    @ObservedObject var viewModel: MainMenuViewModel
    
    @State private var refresh = Refresh(started: false, released: false)
    let impactGenerator = UIImpactFeedbackGenerator(style: .rigid)
    @State private var showModal = false
    @State private var selectedButtonIndex: Int = 0
    //    var color = Color("colorGrayBg")
    //    @State private var post: PostInfo
    var filterNaeme = [
        "все",
        "завтрак",
        "десерты",
        "обед"
    ]
    
    init() {
        self.viewModel = MainMenuViewModel()
    }
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<filterNaeme.count, id: \.self) { index in
                        Button {
                            //filterModel
                            if filterNaeme[index] != "все" {
                                withAnimation(Animation.linear) {
                                    impactGenerator.impactOccurred()
                                    viewModel.fetchFilterNews(filterName: filterNaeme[index])
                                }
                            } else {
                                withAnimation(Animation.linear) {
                                    impactGenerator.impactOccurred()
                                    viewModel.fetchNews()
                                }
                            }
                            selectedButtonIndex = index
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 16)
                                    .frame(height: UIScreen.main.bounds.height/20)
                                    .foregroundColor(index == selectedButtonIndex ? Color("mainBgColor") : Color("colorGrayBg"))
                                Text(filterNaeme[index].localized().uppercased())
                                    .font(Font.custom("monserat", size: 16).bold())
                                    .foregroundColor(index == selectedButtonIndex ? Color(.white) : Color("text2color"))
                                    .padding(.horizontal)
                            }
                            .padding(.top, 8)
                            .padding(.horizontal, 4)
                        }
                    }
                }
                .frame(height: UIScreen.main.bounds.height/17)
            }
            .scrollIndicators(.hidden)
            Spacer()
            ScrollView {
                
                if refresh.started && refresh.released {
                    ProgressView()
                        .padding(.bottom, 20)
                        .offset(y: 15)
                }
                
                GeometryReader { reader -> AnyView in
                    DispatchQueue.main.async {
                        if refresh.startOffset == 0 {
                            refresh.startOffset = reader.frame(in: .global).minY
                        }
                        
                        refresh.offset = reader.frame(in: .global).minY
                        
                        if refresh.offset - refresh.startOffset > 120 && !refresh.started {
                            refresh.started = true
                        }
                        
                        if refresh.startOffset == refresh.offset && refresh.started && !refresh.released {
                            withAnimation(Animation.linear){refresh.released = true}
                            updateDate()
                        }
                    }
                    
                    return AnyView(Color.black.frame(width: 0, height: 0))
                }
                
                
                
                ForEach(viewModel.posts) { post in
                    Button {
                        //postView
                        withAnimation(Animation.linear) {
                            impactGenerator.impactOccurred()
                            showModal = true
                        }
                    } label: {
                        PostCell(post: PostInfo(imageName: post.imageName, titleName: post.titleName))
                    }
                    //item
                    .sheet(isPresented: $showModal) {
                        PostView(post: PostInfo(imageName: post.imageName, textLabel: post.textLabel ?? "" , titleName: post.titleName))
                    }
                }
            }
            .padding(.bottom, 66)
            .scrollIndicators(.hidden)
        }
    }
    
    func updateDate() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(Animation.linear) {
                impactGenerator.impactOccurred()
                refresh.released = false
                refresh.started = false
            }
        }
    }
    
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Refresh {
    var startOffset: CGFloat = 0
    var offset: CGFloat = 0
    var started: Bool
    var released: Bool
}
