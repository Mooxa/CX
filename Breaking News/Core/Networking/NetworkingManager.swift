//
//  NetworkingManager.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 22/06/2021.
//

import Foundation

struct NetworkManager {

    func fetchData<Model: Decodable>(url : String, completion : @escaping (Model?) -> ()) {
        let sessionURL = URL(string: url)
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: sessionURL!) { (data, response, error) in
            if error == nil {
                if let safeData = data {
                    do {
                        let decodedData = try JSONDecoder().decode(Model.self, from: safeData)
                        completion(decodedData)
                    } catch {
                        print("error while parsing data \(error)")
                    }
                } else {
                    debugPrint("failed to fetch data")
                    completion(nil)
                }
            }
            else {
                print("error in data task is \(String(describing: error))")
                completion(nil)
            }
        }
        dataTask.resume()
    }
    
    func fetchData<T: Decodable>(urlString: String, completion: @escaping (Result<T,Error>) -> Void) {
        guard let url = URL(string: urlString) else { return } // or throw an error
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error { completion(.failure(error)); return }
            completion( Result{ try JSONDecoder().decode(T.self, from: data!) })
        }.resume()
    }
}
