//
//  NewsViewModel.swift
//  NewsApp-SwiftUI
//
//  Created by Gorkem on 7.07.2023.
//

import Combine
import Foundation

protocol NewsViewModel {
    func getArticles()
}

class NewsViewModelImpl: ObservableObject, NewsViewModel {
    
    private let service: NewsService
    
    private(set) var articles = [Article]()
    private var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var state: ResultState = .loading
    
    init(service: NewsService) {
        self.service = service
    }
    
    func getArticles() {
        
        self.state = .loading
        
        let cancellable = service
            .request(from: .getNews)
            .sink { res in
                switch res {
                case .finished:
                    self.state = .success(content: self.articles)
                    // Send back the articles
                    break
                case .failure(let error):
                    self.state = .failed(error: error)
                    // Send back the error
                    break
                }
            } receiveValue: { response in
                self.articles = response.articles!
            }
        
        self.cancellables.insert(cancellable)
        
    }
    
    
}
