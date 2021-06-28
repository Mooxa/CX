//
//  CommentViewModel.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 11/06/2021.
//

import Foundation


final class CommentViewModel: ObservableObject{
    
    let service =  CommentRemoteDataSource()
    @Published  var comments: [Comment] = []
    @Published  var newComments: [Comment] = []
    @Published  var commentsFilter: [Comment] = []
    @Published  var selected: Bool = false
    func fetch(id: String) {
        var groupSubComment: [Comment] = []
        service.getComments(id: id) {result in
            do {
                self.newComments += try result.get()
                for var comment  in  self.newComments {
                    for  subcomment  in  self.newComments {
                        if comment.idcomment == subcomment.subcomment {
                            
                            groupSubComment.append(subcomment)
                           
                        }
                    }
                    comment.subCommentaries = groupSubComment
                    
                    self.comments.append(comment)
                }
                
                self.commentsFilter = self.comments.filter{ $0.subcomment == "0" }
                
                
            } catch {
                self.comments = []
            }
        }
    }
    
    func subCommentaries(comment: Comment) ->  String{
        if comment.subCommentaries.count == 0 {
            return "Be the first to comment"
        } else {
            if comment.subCommentaries.count == 1 {
                return "\(comment.subCommentaries[0].username) replied"
            } else {
                return "\(comment.subCommentaries[0].username) and \(comment.subCommentaries.count - 1) others replied"
            }
        }
    }
}
