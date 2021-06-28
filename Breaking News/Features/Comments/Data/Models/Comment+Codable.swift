//
//  Comment+Codable.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 10/06/2021.
//

import Foundation


extension Comment: Decodable{

    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.idcomment = try container.decode(String.self, forKey: .idcomment)
        self.userid = try container.decode(String.self, forKey: .userid)
        self.usernamecomment = try container.decode(String.self, forKey: .usernamecomment)
        self.usercomment = try container.decode(String.self, forKey: .usercomment)
        self.disableSubComments = try container.decode(String.self, forKey: .disableSubComments)
        self.tempscomment = try container.decode(Int.self, forKey: .tempscomment)
        
        self.textcomment = try container.decode(String.self, forKey: .textcomment)
        self.newscomment = try container.decode(String.self, forKey: .newscomment)
        self.premiumcomment = try container.decode(String.self, forKey: .premiumcomment)
        self.likescomment = try container.decode(String.self, forKey: .likescomment)
        self.dislikescomment = try container.decode(String.self, forKey: .dislikescomment)
        self.subcomment = try container.decode(String.self, forKey: .subcomment)
        
        self.realsubcomment = try container.decode(String.self, forKey: .realsubcomment)
        self.countsubcoms = try container.decode(String.self, forKey: .countsubcoms)
        self.countsubcoms = try container.decode(String.self, forKey: .countsubcoms)
        self.countrycomment = try container.decode(String.self, forKey: .countrycomment)
        self.ban = try container.decode(String.self, forKey: .ban)
        self.reclamations = try container.decodeIfPresent(String.self, forKey: .reclamations) ?? "Actualité locale"
        self.spam = try container.decode(String.self, forKey: .spam)
        
        self.userKarma = try container.decode(String.self, forKey: .userKarma)
        self.uid = try container.decode(String.self, forKey: .uid)
        self.robotModerated = try container.decode(String.self, forKey: .robotModerated)
        self.hasHistory = try container.decode(String.self, forKey: .hasHistory)
        self.typeMedia = try container.decode(String.self, forKey: .typeMedia)
        self.typeMedia = try container.decode(String.self, forKey: .typeMedia)
        self.photocomment = try container.decode(String.self, forKey: .photocomment)
        self.linkurlcomment = try container.decode(String.self, forKey: .linkurlcomment)
        self.linkimagecomment = try container.decode(String.self, forKey: .linkimagecomment)
        self.linktitlecomment = try container.decode(String.self, forKey: .linktitlecomment)
        self.linkaudiocomment = try container.decode(String.self, forKey: .linkaudiocomment)
        self.audiocomment = try container.decodeIfPresent(String.self, forKey: .audiocomment) ?? "Actualité locale"
        self.hidecomment = try container.decode(String.self, forKey: .hidecomment)
        
        
        self.totallikes = try container.decode(String.self, forKey: .totallikes)
        self.totalcomment = try container.decode(String.self, forKey: .totalcomment)
        self.utemps = try container.decode(String.self, forKey: .utemps)
        self.ucountry = try container.decode(String.self, forKey: .ucountry)
        self.trusteduser = try container.decode(String.self, forKey: .trusteduser)
        self.usfcm = try container.decode(String.self, forKey: .usfcm)
        self.uwoman = try container.decode(String.self, forKey: .uwoman)
        self.userphoto = try container.decode(String.self, forKey: .userphoto)
        self.username = try container.decodeIfPresent(String.self, forKey: .username) ?? "Actualité locale"
        self.uemail = try container.decode(String.self, forKey: .uemail)
        
        self.userCountry = try container.decode(String.self, forKey: .userCountry)
        self.userLangue = try container.decode(String.self, forKey: .userLangue)
        self.karmaRefresh = try container.decode(String.self, forKey: .karmaRefresh)
        self.isspammer = try container.decode(String.self, forKey: .isspammer)
        self.totalfollowing = try container.decode(String.self, forKey: .totalfollowing)
        self.totalfollowers = try container.decode(String.self, forKey: .totalfollowers)
        self.totalposts = try container.decode(String.self, forKey: .totalposts)
        self.lastconnect = try container.decode(String.self, forKey: .lastconnect)
        self.verified = try container.decodeIfPresent(String.self, forKey: .verified) ?? "Actualité locale"
        self.totaldislikes = try container.decode(String.self, forKey: .totaldislikes)
        
        self.comban = try container.decode(String.self, forKey: .comban)
        self.uPublicKey = try container.decodeIfPresent(String.self, forKey: .uPublicKey) ?? "Actualité locale"
        self.usource = try container.decode(String.self, forKey: .usource)
    }
    
    enum CodingKeys: String, CodingKey {
         case idcomment, userid, usernamecomment, textcomment, tempscomment, usercomment, newscomment, premiumcomment, likescomment, dislikescomment, subcomment, disableSubComments, realsubcomment, countsubcoms, countrycomment, ban, reclamations, spam, hidecomment, audiocomment, linkaudiocomment, linktitlecomment, linkimagecomment, linkurlcomment, photocomment, typeMedia, hasHistory
         case robotModerated = "robot_moderated"
         case uid
         case userKarma = "user_karma"
         case uemail, username, userphoto, uwoman, usfcm, trusteduser, ucountry, utemps, totalcomment, totallikes, totaldislikes, verified, lastconnect, totalposts, totalfollowers, totalfollowing, isspammer
         case karmaRefresh = "karma_refresh"
         case userLangue = "user_langue"
         case userCountry = "user_country"
         case usource
         case uPublicKey = "u_public_key"
         case comban
     }
    
    
}
