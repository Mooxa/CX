//
//  SubCommentListView.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 15/06/2021.
//

import SwiftUI

struct SubCommentListView: View {
    
    var comment: Comment
    @Binding var showSheetView: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                CommentViewRow(comment: comment)
                List{
                    ForEach(comment.subCommentaries, id: \.self) { comment in
                        CommentViewRow(comment: comment)
                        
                    }
                }
                
                Spacer()
                
            }
            .navigationBarTitle(Text("Commentaries"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                print("Dismissing sheet view...")
                self.showSheetView = false
            }) {
                Text("Done").bold()
            })
            
        }
    }
}

//struct SubCommentListView_Previews: PreviewProvider {
//    static var previews: some View {
//        SubCommentListView(comment: Comment.example, showSheetView: <#Binding<Bool>#>)
//    }
//}
