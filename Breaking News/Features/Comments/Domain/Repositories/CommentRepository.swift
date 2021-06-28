//
//  CommentRepository.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 10/06/2021.
//

import Foundation


protocol CommentRepository {
    func getComments(id: String, completion: @escaping (Result<[Comment], APIError>) -> Void)
}
