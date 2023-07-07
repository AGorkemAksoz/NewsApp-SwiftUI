//
//  ArticleView.swift
//  NewsApp-SwiftUI
//
//  Created by Gorkem on 7.07.2023.
//

import URLImage
import SwiftUI

struct ArticleView: View {
    
    let article: Article
    
    var body: some View {
        HStack {
            if let imgURL = article.image,
               let url = URL(string: imgURL) {
                URLImage(url,
                         failure: { error, _ in
                    PlaceholderImageView()
                },
                         content: { image, info in
                    image
                        .resizable()
                        .scaledToFill()
                })
                .frame(width: 100, height: 100)
                .cornerRadius(10)
                .environment(\.urlImageOptions, URLImageOptions(fetchPolicy: .returnStoreElseLoad(downloadDelay: 0.25)))
            } else {
                PlaceholderImageView()
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(article.title ?? "")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .semibold))
                Text(article.source ?? "N/A")
                    .foregroundColor(.gray)
                    .font(.footnote)
            }
        }
    }
}

struct PlaceholderImageView: View {
    var body: some View {
        Image(systemName: "photo.fill")
            .foregroundColor(.white)
            .background(Color.gray)
            .frame(width: 100, height: 100)
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: .dummyData)
            .previewLayout(.sizeThatFits)
    }
}
