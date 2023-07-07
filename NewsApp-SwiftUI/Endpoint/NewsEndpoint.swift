//
//  NewsEndpoint.swift
//  NewsApp-SwiftUI
//
//  Created by Gorkem on 7.07.2023.
//

import Foundation

protocol APIBuilder {
    var urlRequest: URLRequest { get }
    var baseUrl: URL { get }
    var path: String { get }
}

enum NewsAPI {
    case getNews
}

extension NewsAPI: APIBuilder {
    var baseUrl: URL {
        URL(string: "https://api.lil.software")!
    }
    
    var path: String {
        "/news"
    }
    
    var urlRequest: URLRequest {
        switch self {
        case .getNews:
            return URLRequest(url: self.baseUrl.appendingPathComponent(self.path))
        }
    }
}
