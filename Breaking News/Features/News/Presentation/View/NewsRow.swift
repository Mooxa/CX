//
//  NewsRow.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 03/06/2021.
//

import SwiftUI

struct NewsRow: View {
    @State var showReaction: Bool = false
    @State var news: News
    @ObservedObject var viewModel = NewsViewModel()
    var onCompletion: ((_ reaction: Reaction) -> Void)
    
    
    var body: some View {
        ZStack (alignment: .bottomTrailing){
            VStack(alignment: .leading, spacing: 0) {
                RemoteImage(url: news.imageNews)
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                VStack(alignment: .leading, spacing: 6) {
                    Text("\(news.nameSource.capitalized) \(news.dateAgo)")
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .padding(.top, 6.0)
                    Text(news.titleNews)
                        .font(.headline)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                    Divider()
                    HStack(alignment: .center) {
                        HStack{
                            Image(systemName: "hand.thumbsup")
                            Text(news.numberOfLikes)
                                .scaledToFill()
                                .minimumScaleFactor(0.5)
                                .lineLimit(1)
                        }
                        .onTapGesture {
                            self.showReaction.toggle()
                        }
                        Spacer()
                        HStack{
                            Image(systemName: "ellipsis.bubble")
                            Text("\(news.numberOfComments) Comments")
                                .scaledToFill()
                                .minimumScaleFactor(0.5)
                                .lineLimit(1)
                        }
                        Spacer()
                        HStack{
                            Image(systemName: "hand.thumbsup")
                            Text("Share")
                                .scaledToFill()
                                .minimumScaleFactor(0.5)
                                .lineLimit(1)
                        }
                    }
                    .padding(10.0)
                }
                .padding(8)
                
                
            }
            .background(Color.white)
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0, y: 2)
            if showReaction && !viewModel.isSaving(news: news) {
                HStack(alignment: .center){
                    Spacer()
                    VStack{
                        Image(systemName: "hand.thumbsup")
                            .resizable()
                            .padding()
                            .foregroundColor(.white)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60)
                            .background(Circle().foregroundColor(.green))
                        Text(news.numberOfLikes)
                    }
                    .onTapGesture {
                        onCompletion(.like)
                        
                        self.showReaction = false
                    }
                    Spacer()
                    VStack{
                        Image(systemName: "hand.thumbsdown")
                            .resizable()
                            .padding()
                            .foregroundColor(.white)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60)
                            .background(Circle().foregroundColor(.red))
                        Text(news.numberOfDislikes)
                    }
                    .onTapGesture {
                        onCompletion(.dislike)
                        self.showReaction = false
                    }
                    Spacer()
                }
                .padding(20)
                .background(RoundedRectangle(cornerRadius: 25).padding(12.0).foregroundColor(.white))
                .frame(width: .infinity, height: 140)
                .offset(y: /*@START_MENU_TOKEN@*/-42.0/*@END_MENU_TOKEN@*/)
            }
            
            
        }
        
        
        
    }
}

//struct NewsRow_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsRow(news: News.example, onCompletion: ((_ reaction: Reaction) -> Void))
//    }
//}
