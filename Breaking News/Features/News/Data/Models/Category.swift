//
//  Category.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 03/06/2021.
//

import Foundation

enum Category: String, CaseIterable, Identifiable {
    var id: String {
        return rawValue
    }
//    static var allCases: [Category] {
//        return [.for_you, .trending, .videos, .local, .breaking, .the_latest]
//       }
    
    case for_you
    case trending
    case videos
    case local
    case breaking
    case the_latest
    
    var name: String {
        switch self {
        case .for_you: return "for_you_news_list"
        case .trending: return "trending_news"
        case .videos: return "videos_list"
        case .local: return "local_news"
        case .breaking: return "breaking_news_list"
        case .the_latest: return "latest_news"
        }
    }
    
    var urlSuffix: String {
        return self.rawValue
    }
    
    //  var icon: String {
    //    switch self {
    //    case .best: return "rosette"
    //    case .new: return "clock"
    //    case .top: return "flame.fill"
    //    case .ask: return "questionmark.circle"
    //    case .show: return "eye"
    //    }
    //  }
}

enum Reaction: String, CaseIterable{
    
    case like
    case dislike
    
    var name: String {
        switch self {
        case .like: return "1"
        case .dislike: return "0"
        }
    }
}
