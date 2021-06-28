//
//  News+Codable.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 03/06/2021.
//

import Foundation


extension News: Decodable{
    
    
    enum CodingKeys: String, CodingKey {
        
        case id = "idnews"
        case titleNews = "titlenews"
        case textNews = "textnews"
        case urlNews = "urlnews"
        case imageNews = "imagenews"
        case tempsNews = "tempsnews"
        case numberOfLikes = "clikes"
        case numberOfDislikes = "cdislikes"
        case numberOfComments = "ttcomments"
        case nameSource = "namesource"
        case urlSource = "urlsource"
        case iconSource = "iconsource"
        case nomTopic = "nomtopic"
        case photoTopic = "phototopic"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.titleNews = try container.decode(String.self, forKey: .titleNews)
        self.textNews = try container.decode(String.self, forKey: .textNews)
        self.urlNews = try container.decode(String.self, forKey: .urlNews)
        self.imageNews = try container.decode(String.self, forKey: .imageNews)
        self.tempsNews = try container.decode(Int.self, forKey: .tempsNews)
        self.numberOfLikes = try container.decode(String.self, forKey: .numberOfLikes)
        self.numberOfDislikes = try container.decode(String.self, forKey: .numberOfDislikes)
        self.numberOfComments = try container.decode(String.self, forKey: .numberOfComments)
        self.nameSource = try container.decode(String.self, forKey: .nameSource)
        self.urlSource = try container.decode(String.self, forKey: .urlSource)
        self.iconSource = try container.decode(String.self, forKey: .iconSource)
        self.nomTopic = try container.decodeIfPresent(String.self, forKey: .nomTopic) ?? "Actualité locale"
        self.photoTopic = try container.decode(String.self, forKey: .photoTopic)
    }
}
