//
//  LocalDataSource.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 28/06/2021.
//

import Foundation
import CoreData


protocol NewsLocalDataSourceProtocol{
    func addNewsId(newsId: String)
    
    func getNews(for news: News) -> New?
}


final class NewsLocalDataSource:  NewsLocalDataSourceProtocol {
    
    var dbHelper: CoreDataHelper = CoreDataHelper.shared
    
    func addNewsId(newsId: String) {
        let entity = New.entity()
        let news = New(entity: entity, insertInto: dbHelper.context)
        news.newsId = newsId
        dbHelper.create(news)
    }
    
    
    func getNews(for news: News) -> New? {
        let predicate = NSPredicate(
            format: "newsId = %@",
            news.id as CVarArg)
        print("\(predicate)")
        let result = dbHelper.fetchFirst(New.self, predicate: predicate)
        switch result {
        case .success(let news):
            return news
        case .failure(_):
            return nil
        }
    }
    
}
