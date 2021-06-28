//
//  UserRequest.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 22/06/2021.
//

import Foundation
import Combine


struct LoginUser: Requests {
    var parameters: [URLQueryItem]?
    typealias ReturnType = User
    var path: String = "/createAccount.php"
    var method: HTTPMethod = .post
    var body: [String: Any]?
    init(parameters: [URLQueryItem]?) {
        self.parameters = parameters
    }
}
