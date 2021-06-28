//
//  UserEndpoint.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 22/06/2021.
//

import Foundation

enum UserEndpoint {
    case saveUser(user: User)
}

extension UserEndpoint: RequestBuilder {
    
    var urlRequest: URLRequest {
        switch self {
        case .saveUser(_):
            guard let url = URL(string: "https://moha.safe.ma/createAccount.php") else {preconditionFailure("Invalid URL format")}
            let request = URLRequest(url: url)
            return request
        }
        
    }
}
