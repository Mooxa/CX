//
//  Option.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 17/06/2021.
//

import SwiftUI


struct Setting: Codable, Identifiable{
    var id =  UUID()
    var title: String
    var values: [InnerSettingValues]
}

struct InnerSettingValues: Codable, Identifiable{
    var id =  UUID()
    var imageName: String
    var title: String
    var description: String
    var isUseToggle: Bool
}
