//
//  CommentEndpoint.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 10/06/2021.
//

import Foundation

enum CommentEndpoint {
    case getComment(id: String)
}

extension CommentEndpoint: RequestBuilder {
    
    var urlRequest: URLRequest {
        switch self {
        case .getComment(_):
            guard let url = URL(string: "https://moha.safe.ma/getNewsComments.php?id=25989446")
                else {preconditionFailure("Invalid URL format")}
            let request = URLRequest(url: url)
            return request
        }
        
    }
}
