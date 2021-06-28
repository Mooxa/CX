//
//  Comment.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 10/06/2021.
//

import Foundation

struct Comment: Identifiable, Hashable{
    let id = UUID()
    let idcomment, userid, usernamecomment, textcomment: String
    let tempscomment: Int
    let usercomment, newscomment, premiumcomment, likescomment: String
    let dislikescomment, subcomment, disableSubComments, realsubcomment: String
    var countsubcoms, countrycomment, ban, reclamations: String
    let spam, hidecomment, audiocomment, linkaudiocomment: String
    let linktitlecomment, linkimagecomment, linkurlcomment, photocomment: String
    var typeMedia, hasHistory, robotModerated, uid: String
    let userKarma, uemail, username: String
    let userphoto: String
    let uwoman, usfcm, trusteduser, ucountry: String
    let utemps, totalcomment, totallikes, totaldislikes: String
    let verified, lastconnect, totalposts, totalfollowers: String
    let totalfollowing, isspammer, karmaRefresh, userLangue: String
    let userCountry, usource, uPublicKey, comban: String
    var subCommentaries: [Comment] = []
    
    var initial: String  {
        let firstname = username.uppercased().first ?? Character(" ")
        return "\(firstname)"
      }
   
    
    #if DEBUG
    static let example = Comment(idcomment: "2", userid: "2744231", usernamecomment: "", textcomment: "Test comment", tempscomment: 1622882948, usercomment: "", newscomment: "25989446", premiumcomment: "0", likescomment: "0", dislikescomment: "0", subcomment: "0", disableSubComments: "0", realsubcomment: "0", countsubcoms: "0", countrycomment: "", ban: "0", reclamations: "0", spam: "0", hidecomment: "0", audiocomment: "0", linkaudiocomment: "", linktitlecomment: "", linkimagecomment: "", linkurlcomment: "", photocomment: "", typeMedia: "0", hasHistory: "0", robotModerated: "0", uid: "2744231", userKarma: "0", uemail: "gettuto@gmail.com", username: "simokhan", userphoto: "https://skipass.fr/p/users/406482/profile-6337-3.jpg", uwoman: "0", usfcm: "", trusteduser: "0", ucountry: "", utemps: "2021-06-05 11:04:21", totalcomment: "0", totallikes: "0", totaldislikes: "0", verified: "0", lastconnect: "0", totalposts: "0", totalfollowers:  "0", totalfollowing: "0", isspammer: "1", karmaRefresh: "1", userLangue: "0", userCountry:  "0", usource: "1", uPublicKey: "", comban:  "0")
    #endif
}
