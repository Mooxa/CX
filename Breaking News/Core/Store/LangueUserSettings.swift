//
//  LangueUserSettings.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 02/06/2021.
//

import Foundation
import Combine

class LangueUserSettings: ObservableObject {
    @Published var language: String {
        didSet {
            UserDefaults.standard.set(language, forKey: "language")
        }
    }
    
    @Published var country: String {
        didSet {
            UserDefaults.standard.set(country, forKey: "country")
        }
    }
    @Published var email: String {
        didSet {
            UserDefaults.standard.set(email, forKey: "email")
        }
    }
    
    @Published var userphoto: String {
        didSet {
            UserDefaults.standard.set(userphoto, forKey: "userphoto")
        }
    }
    @Published var username: String {
        didSet {
            UserDefaults.standard.set(username, forKey: "username")
        }
    }
    
    @Published var privateKey: String {
        didSet {
            UserDefaults.standard.set(privateKey, forKey: "privateKey")
        }
    }
    @Published var publicKey: String {
        didSet {
            UserDefaults.standard.set(publicKey, forKey: "publicKey")
        }
    }
    

    
    init() {
        self.language = UserDefaults.standard.object(forKey: "language") as? String ?? ""
        self.country = UserDefaults.standard.object(forKey: "country") as? String ?? ""
        self.email = UserDefaults.standard.object(forKey: "email") as? String ?? ""
        self.username = UserDefaults.standard.object(forKey: "username") as? String ?? ""
        self.userphoto = UserDefaults.standard.object(forKey: "userphoto") as? String ?? ""
        self.publicKey = UserDefaults.standard.object(forKey: "publicKey") as? String ?? ""
        self.privateKey = UserDefaults.standard.object(forKey: "privateKey") as? String ?? ""
    }
}


