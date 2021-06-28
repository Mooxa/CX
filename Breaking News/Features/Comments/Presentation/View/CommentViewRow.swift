//
//  CommentViewRow.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 10/06/2021.
//

import SwiftUI

struct CommentViewRow: View {
    
    var comment: Comment
    @ObservedObject var viewModel = CommentViewModel()
    @Environment(\.presentationMode) var presentationMode
    @State var showSheetView = false
    
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text(comment.initial)
                    .foregroundColor(.white)
                    .frame(width: 40, height: 40, alignment: .center)
                    .background(Color(.systemBlue))
                    .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    Text(comment.username)
                        .font(.headline)
                    Text("⭐ \(comment.userKarma)")
                        .font(.caption)
                        .foregroundColor(.black)
                        .padding(4)
                        .background(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(Color.secondary.opacity(0.2)))
                    
                }
                Spacer()
                
                Image(systemName: "ellipsis")
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color.secondary.opacity(0.6))
            }
            VStack{
                Text(comment.textcomment)
                    .font(.body)
                    .frame(maxWidth: .infinity, alignment: .leading)
                HStack{
                    HStack {
                        Image(systemName: "arrowshape.turn.up.left")
                        Text(" Reply")
                        Image("star-badge")
                            .resizable()
                            .frame(width: 20, height: 20)
                        
                    }
                    Spacer()
                    HStack {
                        Image(systemName: "hand.thumbsup.fill")
                            .foregroundColor(Color.secondary.opacity(0.6))
                        Text(comment.likescomment)
                        Image(systemName: "hand.thumbsdown.fill")
                            .foregroundColor(Color.secondary.opacity(0.6))
                        Text(comment.dislikescomment)
                        Image(systemName: "chart.bar.fill")
                            .foregroundColor(Color.secondary.opacity(0.6))
                        
                    }
                    
                    
                    
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding(4)
                
                
            }
            .padding()
            .frame(maxWidth: .infinity,alignment: .leading)
            .background(RoundedRectangle(cornerRadius: 4)
                            .foregroundColor(Color.secondary.opacity(0.2)))
            HStack{
                Image("iconx")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .background(Color.red)
                    .frame(width: 20, height: 20)
                    .clipShape(Circle())
                
                Text("\(viewModel.subCommentaries(comment: comment))")
                    .font(.body)
                   
            }
            .onTapGesture {
                self.showSheetView.toggle()
                
            }
            .sheet(isPresented: $showSheetView) {
                SubCommentListView(comment: comment, showSheetView: self.$showSheetView)
            }
            .padding(8)
            .frame(maxWidth: .infinity,alignment: .leading)
            .background(RoundedRectangle(cornerRadius: 4)
                            .foregroundColor(Color.secondary.opacity(0.2)))
        }
        .padding()
        .frame(maxWidth: .infinity,alignment: .leading)
    }
}

struct SheetView: View {
    var body: some View {
        Text("Sheet View")
    }
}

struct CommentViewRow_Previews: PreviewProvider {
    static var previews: some View {
        CommentViewRow(comment: Comment.example)
    }
}
