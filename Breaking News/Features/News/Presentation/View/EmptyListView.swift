//
//  EmptyListView.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 05/06/2021.
//

import SwiftUI


struct EmptyListView: View {
    @State var news: [News]
    @ObservedObject var viewModel = NewsViewModel()
    var body: some View {
        listView
    }
    
    
    @ViewBuilder
    var listView: some View {
        if news.isEmpty {
            emptyListView
        } else {
            objectsListView
        }
    }
    var objectsListView: some View {
        ForEach(news, id: \.id) { article in
            NavigationLink(destination: NewsDetailView(news: article )) {
                NewsRow(news: $article) { reaction in
                    viewModel.sendReaction(reaction: reaction, news: article.id )
                }
                
            }
            .navigationBarTitle("", displayMode: .inline)
        }
    }
    
    var emptyListView: some View {
        VStack(alignment: .center){
            
            Text("Oops, loos like there's no data...")
                .font(.title)
                .padding()
            Button(action: {
                viewModel.onAppear()
            }) {
                Image(systemName: "goforward")
                    .font(.system(size: 60))
                    .foregroundColor(.secondary)
            }
            Text("Tap Button to Reload")
                .font(.subheadline)
                .padding()
        }
        
    }
    
 
}

//struct EmptyListView_Previews: PreviewProvider {
//    static var previews: some View {
//        EmptyListView<News>(objects: [News.example])
//    }
//}
