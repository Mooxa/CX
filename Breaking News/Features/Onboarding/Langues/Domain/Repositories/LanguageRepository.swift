//
//  LanguageRepository.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 01/06/2021.
//

import Foundation

protocol LanguageRepository {
    func getLanguagesList(completion: @escaping (Result<[Language], APIError>) -> Void)
}
