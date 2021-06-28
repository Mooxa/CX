//
//  User.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 22/06/2021.
//

import Foundation




struct User: Codable, Equatable {
    let email: String
    let username: String?
    let userphoto: String
    let userwoman, fcm, source, langue: String?
    let country, privateKey, publicKey: String

    enum CodingKeys: String, CodingKey {
        case email, username, userphoto, userwoman, fcm, source, langue, country
        case privateKey = "u_private"
        case publicKey = "u_public"
    }
  
}
