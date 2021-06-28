//
//  Language+Codable.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 01/06/2021.
//

import Foundation




extension Language: Decodable{
    
    
    enum CodingKeys: String, CodingKey {
        
        case id  = "idedition"
        case nameEdition = "nameedition"
        case nameEditionCode = "nameeditioncode"
        case descriptionEdition = "descriptionedition"
        case iconEdition = "iconedition"
        case orderEdition = "order_edition"
        case breakingNews = "breakingnews"
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.nameEdition = try container.decode(String.self, forKey: .nameEdition)
        self.nameEditionCode = try container.decode(String.self, forKey: .nameEditionCode)
        self.descriptionEdition = try container.decode(String.self, forKey: .descriptionEdition)
        self.iconEdition = try container.decode(String.self, forKey: .iconEdition)
        self.orderEdition = try container.decode(String.self, forKey: .orderEdition)
        self.breakingNews = try container.decode(String.self, forKey: .breakingNews)
    }
}
