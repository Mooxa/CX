//
//  LanguageRepositoryImplementation.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 01/06/2021.
//

import Foundation


final class LanguageRepositoryImplementation: LanguageRepository{

    
    let dataSource: LanguageRemoteDataSource
  
    init(dataSource: LanguageRemoteDataSource) {
      self.dataSource = dataSource
    }
    func getLanguagesList(completion: @escaping (Result<[Language], APIError>) -> Void) {
        dataSource.getLanguageList(completion: completion)
    }
    
    
}
