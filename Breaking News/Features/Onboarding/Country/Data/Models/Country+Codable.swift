//
//  Country+Codable.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 02/06/2021.
//

import Foundation


extension Country: Decodable{
    
    
    enum CodingKeys: String, CodingKey {
        
        case id  = "idcountryedition"
        case nameCountry = "NameCountry"
        case countryCode = "countrycode"
        case photoCountry
        case orderCountry = "order_country"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.nameCountry = try container.decode(String.self, forKey: .nameCountry)
        self.countryCode = try container.decode(String.self, forKey: .countryCode)
        self.photoCountry = try container.decode(String.self, forKey: .photoCountry)
        self.orderCountry = try container.decode(String.self, forKey: .orderCountry)
    }
}
