//
//  GetCommentUseCase.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 10/06/2021.
//

import Foundation


class GetCommentUseCase {
    private let repository: CommentRepository
    
    required init(repository: CommentRepository) {
        self.repository = repository
    }
    func execute(id: String, completion: @escaping (Result<[Comment], APIError>) -> Void) {
        self.repository.getComments(id: id, completion: completion)
    }
}
