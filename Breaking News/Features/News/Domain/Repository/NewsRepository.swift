//
//  NewsRepository.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 03/06/2021.
//

import Foundation


protocol NewsRepository {
    func getForYouNews(completion: @escaping (Result<[News], APIError>) -> Void)
}
