//
//  NewsListRequest.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 03/06/2021.
//

import Foundation
import Combine

protocol NewsListRequest {
    var apiSession: APIService {get}
    
    func getNewsList(type: Category, langue: String,  country: String) -> AnyPublisher<[News], APIError>
    func sendReaction(reaction: Reaction, news: String, email: String)  -> AnyPublisher<Response, APIError>

}

extension NewsListRequest {
    
    func getNewsList(type: Category, langue: String,  country: String) -> AnyPublisher<[News], APIError> {
        return apiSession.request(with: NewsEndpoint.getNewsList(type: type,langue: langue, country: country))
            .eraseToAnyPublisher()
    }
    
    func sendReaction(reaction: Reaction, news: String, email: String)  -> AnyPublisher<Response, APIError>{
        return apiSession.request(with: NewsEndpoint.sendReaction(reaction: reaction, news: news, email: email))
            .eraseToAnyPublisher()
    }
}
