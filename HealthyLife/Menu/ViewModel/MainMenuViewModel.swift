//
//  MainMenuViewModel.swift
//  HealthyLife
//
//  Created by Maksim Kosharny on 07.06.2023.
//

import Foundation

class MainMenuViewModel: ObservableObject {
    @Published var posts = [PostInfo]()
    let servise = PostServises()
    
    init() {
        fetchNews()
        fetchFilterNews(filterName: "")
    }
    
    func fetchNews() {
        servise.fetchNews { post in
            self.posts = post
        }
    }
    
    func fetchFilterNews(filterName: String) {
        servise.fetchFilterNews(filterName: filterName) { post in
                self.posts = post
        }
    }
}
