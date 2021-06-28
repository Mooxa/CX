//
//  LanguageRemoteDataSource.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 01/06/2021.
//

import Foundation
import Combine
final class LanguageRemoteDataSource: LanguageListRequest {
    
    var apiSession: APIService
      
      var cancellables = Set<AnyCancellable>()
      
      init(apiSession: APIService = APISession()) {
          self.apiSession = apiSession
      }
    
    func getLanguageList(completion: @escaping (Result<[Language], APIError>) -> Void){
        
        let cancellable = self.getLanguageList()
                 .sink(receiveCompletion: { result in
                     switch result {
                     case .failure(let error):
                        completion(.failure(error))
                         print("Handle error: \(error)")
                     case .finished:
                         break
                     }
                     
                 }) { (languageList) in
                    completion(.success(languageList))
             }
             cancellables.insert(cancellable)
    }

}
