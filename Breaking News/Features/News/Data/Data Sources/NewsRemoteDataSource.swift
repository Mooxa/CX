//
//  NewsRemoteDataSource.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 03/06/2021.
//

import Foundation
import Combine
final class NewsRemoteDataSource: NewsListRequest {
 
    
    var langueUserSettings = LangueUserSettings()
    var apiSession: APIService
    
    var cancellables = Set<AnyCancellable>()
    
    init(apiSession: APIService = APISession()) {
        self.apiSession = apiSession
    }
    
    func getNewsList(type: Category, completion: @escaping (Result<[News], APIError>) -> Void){
        
        let cancellable = self.getNewsList(type: type, langue: langueUserSettings.language, country: langueUserSettings.country)
            .sink(receiveCompletion: { result in
                switch result {
                case .failure(let error):
                    completion(.failure(error))
                    print("Handle error: \(error)")
                case .finished:
                    break
                }
                
            }) { (newsList) in
                completion(.success(newsList))
            }
        cancellables.insert(cancellable)
    }
    
    func sendReaction(reaction: Reaction, news: String, completion: @escaping (Result<Response, APIError>) -> Void) {
        let cancellable = self.sendReaction(reaction: reaction, news: news, email: langueUserSettings.privateKey) .sink(receiveCompletion: { result in
            switch result {
            case .failure(let error):
                completion(.failure(error))
                print("Handle error: \(error)")
            case .finished:
                break
            }
            
        }) { (newsList) in
            completion(.success(newsList))
        }
        cancellables.insert(cancellable)
    }
    
}
