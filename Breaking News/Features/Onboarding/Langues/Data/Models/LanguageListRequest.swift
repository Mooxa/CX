//
//  LanguageListRequest.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 01/06/2021.
//

import Foundation

import Combine

protocol LanguageListRequest {
    var apiSession: APIService {get}
    
    func getLanguageList() -> AnyPublisher<[Language], APIError>
}

extension LanguageListRequest {
    
    func getLanguageList() -> AnyPublisher<[Language], APIError> {
        return apiSession.request(with: LanguageEndpoint.getLanguageList)
            .eraseToAnyPublisher()
    }
}
