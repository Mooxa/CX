//
//  CommentRequest.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 10/06/2021.
//

import Foundation
import Combine


protocol CommentRequest {
    var apiSession: APIService {get}
    
    func getComments(id: String) -> AnyPublisher<[Comment], APIError>
}

extension CommentRequest {
    
    func getComments(id: String) -> AnyPublisher<[Comment], APIError>{
        return apiSession.request(with: CommentEndpoint.getComment(id: id))
            .eraseToAnyPublisher()
    }
}
