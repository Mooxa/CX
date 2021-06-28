//
//  Networking.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 01/06/2021.
//

import Foundation

//protocol Networking {
//    func execute<T: Decodable>(_ requestProvider: Request, completion: @escaping (Result<T, NetworkingErrors>) -> Void)
//}
//
//extension Networking {
//    func execute<T: Decodable>(_ requestProvider: Request, completion: @escaping (Result<T, NetworkingErrors>) -> Void) {
//      let urlRequest = requestProvider.urlRequest
//
//    URLSession.shared.dataTask(with: urlRequest) { data, response, error in
//      do {
//        if let error = error {
//            completion(.failure(error as! NetworkingErrors))
//          return
//        }
//
//        guard let data = data else {
//          preconditionFailure("No error was received but we also don't have data...")
//        }
//
//        let decodedObject = try JSONDecoder().decode(T.self, from: data)
//
//        completion(.success(decodedObject))
//      } catch {
//        completion(.failure(error as! NetworkingErrors))
//      }
//    }.resume()
//  }
//}
//
//
