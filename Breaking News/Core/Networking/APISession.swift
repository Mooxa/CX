//
//  APISession.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 02/06/2021.
//

import Foundation
import Combine

struct APISession: APIService {
    func request<T>(with builder: RequestBuilder) -> AnyPublisher<T, APIError> where T: Decodable {
        
        // 1
        let decoder = JSONDecoder()
//        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        // 2
        return URLSession.shared
            .dataTaskPublisher(for: builder.urlRequest)
            // 3
            .receive(on: DispatchQueue.main)
            // 4
            .mapError { _ in .unknown }
            // 5
            .flatMap { data, response -> AnyPublisher<T, APIError> in
                        do {
                            _ =  try decoder.decode(T.self, from: data)
//                            return loaded
                        }catch DecodingError.dataCorrupted(let context) {
                          print(context)
                        } catch DecodingError.keyNotFound(let key, let context) {
                          print("Key '\(key)' not found:", context.debugDescription)
                          print("codingPath:", context.codingPath)
                        } catch DecodingError.valueNotFound(let value, let context) {
                          print("Value '\(value)' not found:", context.debugDescription)
                          print("codingPath:", context.codingPath)
                        } catch DecodingError.typeMismatch(let type, let context) {
                          print("Type '\(type)' mismatch:", context.debugDescription)
                          print("codingPath:", context.codingPath)
                        } catch let error{
                          print("error: ", error)
                        }
                if let response = response as? HTTPURLResponse {
                    if (200...299).contains(response.statusCode) {
                    // 6
                    return Just(data)
                        .decode(type: T.self, decoder: decoder)
                        .mapError {_ in .decodingError
                            
                         
                        }
                        .eraseToAnyPublisher()
                    } else {
                    // 7
                        return Fail(error: APIError.httpError(response.statusCode))
                            .eraseToAnyPublisher()
                    }
                }
                return Fail(error: APIError.unknown)
                        .eraseToAnyPublisher()
            }
            .eraseToAnyPublisher()
    }
}
