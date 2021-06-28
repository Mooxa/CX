//
//  GetLanguageListUseCase.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 01/06/2021.
//

import Foundation

class GetLanguageListUseCase {
    private let repository: LanguageRepository
    
    required init(repository: LanguageRepository) {
        self.repository = repository
    }
    func execute(completion: @escaping (Result<[Language], APIError>) -> Void) {
        self.repository.getLanguagesList(completion: completion)
    }
}
