//
//  NewsViewModel.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 03/06/2021.
//

import Foundation
import CoreData


final class NewsViewModel: ObservableObject{
    
    var localDataSource = NewsLocalDataSource()
    @Published var isShowing: Bool = true
    var langueUserSettings = LangueUserSettings()
    
    var selectedTab : Int = 0 {
        didSet {
            news.removeAll()
            fetch(type: Category.allCases[self.selectedTab])
        }
    }
    
    let service =  NewsRemoteDataSource()
    
    @Published  var news: [News] = [] {
        willSet {
            objectWillChange.send()
        }
    }
    
    
    func onAppear() {
        fetch(type: Category.allCases[self.selectedTab])
    }
    func fetch(type: Category) {
        service.getNewsList(type: type)
        {result in
            self.isShowing = false
            do {
                self.news += try result.get()
            } catch {
                self.news = []
            }
            //          self.news = newsResult
            
        }
    }
    
    func loadMore(type: Category) {
        service.getNewsList(type: type) {result in
            self.isShowing = false
            do {
               
                self.news += try result.get()
                print(self.news)
            } catch {
                self.news = []
            }
        }
    }
    
    
    func sendReaction(reaction: Reaction, news: String){
        service.sendReaction(reaction: reaction, news: news){result in
            self.fetch(type: Category.allCases[self.selectedTab])
            self.saveNewsIdLocally(news: news)

        }
    }
    
    
    func saveNewsIdLocally(news: String){
        localDataSource.addNewsId(newsId: news)
    }
    
    func isSaving(news: News) -> Bool {
        guard localDataSource.getNews(for: news) != nil else { return false}
        return true
    }
}
