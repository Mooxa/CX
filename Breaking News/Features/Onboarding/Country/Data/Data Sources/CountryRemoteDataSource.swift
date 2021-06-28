//
//  CountryRemoteDataSource.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 02/06/2021.
//

import Foundation
import Combine
final class CountryRemoteDataSource: CountryListRequest {
    
    var apiSession: APIService
      
      var cancellables = Set<AnyCancellable>()
      
      init(apiSession: APIService = APISession()) {
          self.apiSession = apiSession
      }
    
    func getCountryList(id: String, completion: @escaping (Result<[Country], APIError>) -> Void){
        
        let cancellable = self.getCountryList(id: id)
                 .sink(receiveCompletion: { result in
                     switch result {
                     case .failure(let error):
                        completion(.failure(error))
                         print("Handle error: \(error)")
                     case .finished:
                         break
                     }
                     
                 }) { (countryList) in
                    completion(.success(countryList))
             }
             cancellables.insert(cancellable)
    }

}
