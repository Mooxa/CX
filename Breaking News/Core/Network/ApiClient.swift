//
//  ApiClient.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 23/06/2021.
//

import Foundation
import Combine

struct APIClient {
    var baseURL: String! 
    var networkDispatcher: NetworkDispatcher!
    init(baseURL: String = "https://moha.safe.ma",
         networkDispatcher: NetworkDispatcher = NetworkDispatcher()) {
        self.baseURL = baseURL
        self.networkDispatcher = networkDispatcher
    }
    /// Dispatches a Request and returns a publisher
    /// - Parameter request: Request to Dispatch
    /// - Returns: A publisher containing decoded data or an error
    func dispatch<R: Requests>(_ request: R) -> AnyPublisher<R.ReturnType, NetworkRequestError> {
        guard let urlRequest = request.asURLRequest(baseURL: baseURL) else {
            return Fail(outputType: R.ReturnType.self, failure: NetworkRequestError.badRequest).eraseToAnyPublisher()
        }
        typealias RequestPublisher = AnyPublisher<R.ReturnType, NetworkRequestError>
        let requestPublisher: RequestPublisher = networkDispatcher.dispatch(request: urlRequest)
        return requestPublisher.eraseToAnyPublisher()
    }
    
    func request<R: Requests>(_ request: R, completion: @escaping (Result<R.ReturnType, NetworkRequestError>) -> Void)   {
        
        guard let urlRequest = request.asURLRequest(baseURL: baseURL) else {
            return
        }
        
        let decoder = JSONDecoder()
        URLSession.shared.dataTask(with: urlRequest){ (data, response, error) in
            if error == nil {
                if let safeData = data {
                    do {
                        let decodedData = try decoder.decode(R.ReturnType.self, from: safeData)
                        completion(.success(decodedData))
                    } catch {
                        print("error while parsing data \(error)")
                    }
                } else {
                    debugPrint("failed to fetch data")
                    completion(.failure(.unknownError))
                }
            }
            else {
                print("error in data task is \(String(describing: error))")
                completion(.failure(.unknownError))
            }
        }.resume()
    }
}
