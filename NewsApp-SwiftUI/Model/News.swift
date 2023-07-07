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

extension Article {
    static var dummyData: Article {
        .init(author: "Andrew deGrandpre",
              url: "https://www.washingtonpost.com/national-security/2023/07/05/us-navy-iran-video-tankers/",
              source: "The Washington Post",
              title: "U.S. Navy says it foiled Iran's attempt to seize oil tankers - The Washington Post",
              description: "The U.S. Navy said that it thwarted efforts by Iran to commandeer two commercial oil tankers off Oman, and that one attempted seizure involved intense gunfire.",
              image: "https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/EHPYEXDPRGBEUSFB3NKFVAIUMU.JPG&w=1440",
              date: Date()
        )
    }
}
