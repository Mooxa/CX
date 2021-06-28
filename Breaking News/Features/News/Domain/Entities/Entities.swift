//
//  Entities.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 03/06/2021.
//

import Foundation

struct News: Hashable, Identifiable {
    var id: String
    var titleNews: String
    var textNews: String
    var urlNews: String
    var imageNews: String
    var tempsNews: Int
    var numberOfLikes: String
    var numberOfDislikes: String
    var numberOfComments: String
    var nameSource: String
    var urlSource: String
    var iconSource: String
    var nomTopic: String
    var photoTopic: String
    
    var dateAgo  : String  {
        return tempsNews.timestampToTimeAgo()
    }
    #if DEBUG
    static let example = News(id: "27098970", titleNews:  "Thousands Expected In Miami For Bitcoin 2021 Crypto Conference", textNews: "Thousands Expected In Miami For Bitcoin 2021 Crypto Conference", urlNews: "https://www.youtube.com/watch?v=QvJQoJywCv0&utm_source=break.ma&utm_medium=break.ma", imageNews: "https://i.ytimg.com/vi/QvJQoJywCv0/maxresdefault.jpg", tempsNews: 1622817218, numberOfLikes: "0", numberOfDislikes: "0", numberOfComments: "0", nameSource: "NBC News", urlSource: "Nbcnews.com", iconSource: "https://3.bp.blogspot.com/-uxD5faqDs7s/WSP-MyuN7gI/AAAAAAAAG70/EMnACSL3eiQuOT2mQvQx0qir9TGDDPy7wCLcB/s1600/nbcnews.jpeg", nomTopic: "Local News", photoTopic: "http://1.bp.blogspot.com/-5E6FUDq3Df4/Xl05td3UVyI/AAAAAAAAE5Y/pQsmjjKsDRAGtkL4byjTwkTnjTBjHNTqQCK4BGAYYCw/s200/local%2Bnews%2B1.png")
    #endif
}

struct Response: Codable, Equatable {
    let response: String
}
