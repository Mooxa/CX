//
//  CountryListRequest.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 02/06/2021.
//

import Foundation
import Combine

protocol CountryListRequest {
    var apiSession: APIService {get}
    
    func getCountryList(id: String) -> AnyPublisher<[Country], APIError>
}

extension CountryListRequest {
    
    func getCountryList(id: String) -> AnyPublisher<[Country], APIError> {
        return apiSession.request(with: CountryEndpoint.getCountryList(id: id))
            .eraseToAnyPublisher()
    }
}
