//
//  Option+Extension.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 17/06/2021.
//

import Foundation


extension Option{
    static let items: [Option] = [
        
        .init(imageName: "settings", title: "Settings", description: "Customize the app according to your taste"),
        .init(imageName: "location", title: "Local", description: "Your Locations"),
        .init(imageName: "topics", title: "Topics", description: "Your favorite topics"),
        .init(imageName: "newspaper", title: "Saved News", description: "Display your saved news"),
        .init(imageName: "messenger", title: "Messages", description: "Chat with friends on this app"),
        .init(imageName: "bell", title: "Public Alerts", description: "Important alerts from across the web when and where they are needed most."),
        .init(imageName: "shared", title: "Share the App", description: "Have you enjoyed our app? Share it please with Your inends and familv"),
        .init(imageName: "security", title: "Privacy policy", description: "Before starting using the app, you need to read our privacy policy"),
        .init(imageName: "customer", title: "Support us", description: "Did you like this application ? please we need your support")
    ]
}


