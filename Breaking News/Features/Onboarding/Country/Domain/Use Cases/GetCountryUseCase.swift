//
//  GetCountryUseCase.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 02/06/2021.
//

import Foundation

class GetCountryUseCase {
    private let repository: CountryRepository
    
    required init(repository: CountryRepository) {
        self.repository = repository
    }
    func execute(completion: @escaping (Result<[Country], APIError>) -> Void) {
        self.repository.getCountryList(completion: completion)
    }
}
