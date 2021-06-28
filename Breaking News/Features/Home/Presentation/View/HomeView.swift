//
//  HomeView.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 02/06/2021.
//

import SwiftUI

// Tab screens
enum Tabs{
    case news, wall, notif , post, more
    
    var title: String {
        switch self {
        case .news:
            return "News"
        case .wall:
            return "The wall"
        case .notif:
            return "Notifs"
        case .post:
            return "New Post"
        case .more:
            return "More Tab"
        }
    }
}
struct HomeView: View {
    @State var tabSelection: Tabs = .news
    
    var body: some View {
            TabView(selection: $tabSelection) {
                NewsView()
                    .tabItem {
                        Label("News", systemImage: "list.dash")
                    }
                    .tag(Tabs.news)
                
                NewsView()
                    .tabItem {
                        Label("The Wall", systemImage: "person.3.fill")
                    }
                    .tag(Tabs.wall)
                NewsView()
                    .tabItem {
                        Label("New Post", systemImage: "newspaper.fill")
                    }
                    .tag(Tabs.post)
                
                NewsView()
                    .tabItem {
                        Label("Notifs", systemImage: "bell.fill")
                    }
                    .tag(Tabs.notif)
                MoreListView()
                    .tabItem {
                        Label("More Tab", systemImage: "ellipsis.circle.fill")
                    }
                    .tag(Tabs.more)
            }
            .navigationBarTitle(self.tabSelection.title)
        
        
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
