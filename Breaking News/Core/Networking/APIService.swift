//
//  APIService.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 02/06/2021.
//

import Foundation
import Combine

protocol APIService {
    func request<T: Decodable>(with builder: RequestBuilder) -> AnyPublisher<T, APIError>
}
