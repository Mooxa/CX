//
//  CountryRepository.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 02/06/2021.
//

import Foundation

protocol CountryRepository {
    func getCountryList(completion: @escaping (Result<[Country], APIError>) -> Void)
}
