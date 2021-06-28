//
//  Option.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 17/06/2021.
//

import Foundation


struct Option: Codable, Identifiable{
    var id =  UUID()
    var imageName: String
    var title: String
    var description: String
}
