//
//  LoginViewModel.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 16/06/2021.
//

import SwiftUI
import Firebase
import GoogleSignIn
import Combine

class LoginViewModel: NSObject, ObservableObject {
    
    private let user = GIDSignIn.sharedInstance().currentUser
    var langueUserSettings = LangueUserSettings()
    var picture: URL?
    let apiClient = APIClient()
    
    func createAccount(completion: @escaping (Result<User,NetworkRequestError>) -> Void){
        guard let user = GIDSignIn.sharedInstance().currentUser
        else {preconditionFailure("user doesn't exist")}
        
        if user.profile.hasImage
        {
            picture = user.profile.imageURL(withDimension: 150)
        }
        let createUser = User(email: user.profile.email, username: user.profile.name, userphoto: picture?.absoluteString ?? "", userwoman: "false",fcm: nil, source: nil, langue: langueUserSettings.language, country: langueUserSettings.country, privateKey: "", publicKey: "" )
        _ = NetworkDispatcher()
        
        
        var parameters : [URLQueryItem] {
            return [URLQueryItem(name: "email", value: createUser.email),
                    URLQueryItem(name: "username", value: createUser.username!),
                    URLQueryItem(name: "userphoto", value: createUser.userphoto),
                    URLQueryItem(name: "userwoman", value: createUser.userwoman!),
                    URLQueryItem(name: "langue", value: createUser.langue!),
                    URLQueryItem(name: "country", value: "6")
            ]
        }
        
        apiClient.request( LoginUser(parameters: parameters)){ (result : Result<User,NetworkRequestError>) in
            switch result {
            case .success(let user):
                self.langueUserSettings.email  = user.email
                self.langueUserSettings.username  = user.username ?? ""
                self.langueUserSettings.userphoto  = user.userphoto
                self.langueUserSettings.privateKey  = user.privateKey
                self.langueUserSettings.publicKey  = user.publicKey
                
                completion(result)
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
    }
    
    
}



