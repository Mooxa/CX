//
//  LanguageEndpoint.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 02/06/2021.
//

import Foundation


enum LanguageEndpoint {
    case getLanguageList
}

extension LanguageEndpoint: RequestBuilder {
    
    var urlRequest: URLRequest {
        switch self {
        case .getLanguageList:
            guard let url = URL(string: "https://moha.safe.ma/loadeditions.php")
                else {preconditionFailure("Invalid URL format")}
            let request = URLRequest(url: url)
            return request
        }
        
    }
}
