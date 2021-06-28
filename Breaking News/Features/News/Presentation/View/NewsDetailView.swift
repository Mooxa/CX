//
//  NewsDetailView.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 03/06/2021.
//

import SwiftUI

struct NewsDetailView: View {
    @State var text = ""
    @State var labelNumber = 2
    var news: News
    @ObservedObject var viewModel = CommentViewModel()
    @Environment(\.colorScheme) var colorScheme
    @State var selection: Int? = nil
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var tabBar: UITabBar! = nil
    var langueUserSettings = LangueUserSettings()
    
    init( news: News) {
        self.news = news
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().isTranslucent = false
    }
    
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        HStack {
            Image(systemName: "arrow.backward") // set image here
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.black)
        }
    }
    }
    var body: some View{
        
        NavigationView {
            VStack(alignment: .leading) {
                ScrollView{
                    Text(news.titleNews)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .frame(maxWidth:.infinity, alignment: .leading)
                        .lineLimit(3)
                    
                    HStack(alignment: .top) {
                        RemoteImage(url: news.photoTopic)
                            .aspectRatio(contentMode: .fit)
                            .background(Circle())
                            .frame(width: 50, height: 50)
                        
                        VStack(alignment: .leading) {
                            Text(news.nomTopic)
                                .font(.headline)
                            Text(news.dateAgo)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                        }
                        Spacer()
                        Text("Follow")
                            .fontWeight(.semibold)
                            .font(.footnote)
                            .padding(4)
                            .background(Color.red)
                            .cornerRadius(40)
                            .foregroundColor(.white)
                        
                    }
                    
                    RemoteImage(url: news.imageNews)
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    
                    HStack(alignment: .top){
                        Text(news.nameSource)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        Spacer()
                        Image(systemName: "info.circle.fill")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                    }
                    Text(news.textNews)
                        .font(.body)
                    NavigationLink(destination: Webview(url: URL(string: news.urlNews)!), tag: 1, selection: $selection) {
                        EmptyView()
                        
                    }
                    .frame(width: 0).opacity(0.0)
                    
                    
                    Text("Continue Reading")
                        .underline()
                        .foregroundColor(.secondary)
                        .padding(8.0)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .onTapGesture {
                            self.selection = 1
                        }
                    
                    HStack(spacing: 15){
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
                        Divider()
                        VStack{
                            Image("twitter")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60)
                            Text("Share")
                        }
                        VStack{
                            Image("facebook")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60)
                            Text("share")
                        }
                        VStack{
                            Image("share")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60)
                            Text("Share")
                        }
                    }
                    .frame(maxWidth: .infinity)
                    
                    HStack{
                        Text("COMMENTS")
                            .font(.headline)
                            .fontWeight(.bold)
                        Text("\(news.numberOfComments) 🔥")
                            .foregroundColor(.secondary)
                        Spacer()
                        
                        Image(systemName: "eye.slash")
                        
                    }
                    .padding(.vertical, 8.0)
                    .frame(maxWidth:.infinity, alignment: .leading)
                    
                    ForEach(viewModel.commentsFilter, id: \.idcomment) { comment in
                        CommentViewRow(comment: comment)
                        
                    }
                    
                    
                }
                
                ZStack(alignment: .bottomTrailing) {
                    HStack{
                        HStack(){
                            if langueUserSettings.userphoto != " " {
                                RemoteImage(url: langueUserSettings.userphoto)
                                    .frame(width: 36, height: 36)
                                    .aspectRatio(contentMode: .fill)
                                    .clipShape(Circle())
                            } else {
                                Image("profile-user")
                                    .resizable()
                                    .frame(width: 36, height: 36)
                                    .aspectRatio(contentMode: .fill)
                                    .clipShape(Circle())
                            }
                            
                            TextField("Comment", text: $text)
                        }
                        .padding([.top, .leading, .bottom], 4.0)
                        .cornerRadius(50)
                        .overlay(
                            Capsule(style: .circular)
                                .stroke(colorScheme == .dark ? Color.white : Color.black, style: StrokeStyle(lineWidth: 2)))
                        
                        
                        Image(systemName: "ellipsis.bubble.fill")
                            .font(.system(size: 25))
                            .badge(count: Int(news.numberOfComments) ?? 0)
                        
                    }
                    
                    
                }
                .padding(10.0)
            }
            
            .padding(6)
            .onAppear{
                viewModel.fetch(id: news.id)
            }
            .navigationBarTitle(Text(""), displayMode: .inline)
            .navigationBarItems(
                leading: Button(action: { presentationMode.wrappedValue.dismiss() }) {
                    Image(systemName: "arrow.backward")
                        .foregroundColor(.black)
                        .imageScale(.large) })
            .contentShape(Rectangle())
            .gesture(
                DragGesture(coordinateSpace: .local)
                    .onEnded { value in
                        if value.translation.width > .zero
                            && value.translation.height > -30
                            && value.translation.height < 30 {
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
            )
            
            //
        }
        
        
        
    }
    
}

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView(news: News.example)
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
            .previewDisplayName("iPhone 12")
        
        
        NewsDetailView(news: News.example)
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
            .previewDisplayName("iPhone 12 Pro Max")
            .preferredColorScheme(.dark)
    }
}
