//
//  CommentRemoteDataSource.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 11/06/2021.
//

import Foundation
import Combine
final class CommentRemoteDataSource: CommentRequest {
    var apiSession: APIService
    
    var cancellables = Set<AnyCancellable>()
    
    init(apiSession: APIService = APISession()) {
        self.apiSession = apiSession
    }
    
    func getComments(id: String,  completion: @escaping (Result<[Comment], APIError>) -> Void) {
        let cancellable = self.getComments(id: id)
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    completion(.failure(error))
                    print("Handle error: \(error)")
                case .finished:
                    break
                }
                
            }) { (commentList) in
                completion(.success(commentList))
            }
        cancellables.insert(cancellable)
    }
    
    
    
}
