//
//  NewsEndpoint.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 03/06/2021.
//

import Foundation

enum NewsEndpoint {
    case getNewsList(type: Category, langue: String,  country: String)
    
    case sendReaction(reaction: Reaction, news: String, email: String)

}

extension NewsEndpoint: RequestBuilder {
    
    var urlRequest: URLRequest {
        switch self {
        case .getNewsList(let type, let langue, let country):
            guard let url = URL(string: "https://moha.safe.ma/\(type.name).php?langue=\(langue)&country=\(country)")
                else {preconditionFailure("Invalid URL format")}
            let request = URLRequest(url: url)
            return request
        case .sendReaction(let reaction, let news, let email ):
            guard let url = URL(string: "https://moha.safe.ma/likeNews.php?news=\(news)&like=\(reaction.name)&email=\(email)")
                else {preconditionFailure("Invalid URL format")}
            let request = URLRequest(url: url)
            return request
        }
        
        
    }
}
