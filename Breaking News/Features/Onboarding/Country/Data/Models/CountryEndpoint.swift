//
//  CountryEndpoint.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 02/06/2021.
//

import Foundation


enum CountryEndpoint {
    case getCountryList(id: String)
}

extension CountryEndpoint: RequestBuilder {
    
    var urlRequest: URLRequest {
        switch self {
        case .getCountryList(let id):
            guard let url = URL(string: "https://moha.safe.ma/loadcountriesEdition.php?langue=\(id)")
                else {preconditionFailure("Invalid URL format")}
            let request = URLRequest(url: url)
            return request
        }
        
    }
}
