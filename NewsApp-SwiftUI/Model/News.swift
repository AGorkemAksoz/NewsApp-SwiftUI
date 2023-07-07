//
//  News.swift
//  NewsApp-SwiftUI
//
//  Created by Gorkem on 7.07.2023.
//

import Foundation

// MARK: - News
struct News: Codable {
    let articles: [Article]?
}

// MARK: - Article
struct Article: Codable, Identifiable {
    var id = UUID()
    let author: String?
    let url: String?
    let source, title, description: String?
    let image: String?
    let date: Date?
}
