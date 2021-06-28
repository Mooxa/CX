//
//  NewsUseCase.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 03/06/2021.
//

import Foundation

class NewsUseCase {
    private let repository: NewsRepository
    
    required init(repository: NewsRepository) {
        self.repository = repository
    }
    func execute(completion: @escaping (Result<[News], APIError>) -> Void) {
        self.repository.getForYouNews(completion: completion)
    }
}
