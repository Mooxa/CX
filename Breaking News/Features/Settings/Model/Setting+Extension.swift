//
//  Option+Extension.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 17/06/2021.
//

import Foundation

extension Setting {
    static let settings: [Setting] = [
        .init( title: "Content", values: contentValues),
        .init(title: "Notifications",  values: notificationsValues),
        .init( title: "Display", values: displayValues),
        .init(title: "General",  values: generalValues),
        .init(title: "Others", values: othersValues)
    ]
    
    
    static let contentValues: [InnerSettingValues] = [
        .init(imageName: "star-badge", title: "Language Manager", description: "You can change your current edition to another edition language.", isUseToggle: false),
        .init(imageName: "star-badge", title: "My Topics", description: "Manage your topics subscriptions from here", isUseToggle: false),
        .init(imageName: "star-badge", title: "Sources manager", description: "Manage your unfollowed news sources", isUseToggle: false)
    ]
    
    static let notificationsValues: [InnerSettingValues] = [
        .init(imageName: "star-badge", title: "Notifications sound", description: "This option allows to stop notifications sound.", isUseToggle: true),
        .init(imageName: "star-badge", title: "Notifications vibration", description: "This option allows to stop notifications vibration.", isUseToggle: true),
        .init(imageName: "star-badge", title: "Notifications with Image", description: "Do you want to display notifications with image ?", isUseToggle: true),
        .init(imageName: "star-badge", title: "Notifications manager", description: "Enable and disable notifications from here.", isUseToggle: false),
        .init(imageName: "star-badge", title: "Sleeping Time", description: "Click here to manage your Sleeping Time", isUseToggle: false),
        .init(imageName: "star-badge", title: "Disable all notifications", description: "Enable this option if you want to not receive any notifications or alerts.", isUseToggle: false)
    ]
    
    
    static let displayValues: [InnerSettingValues] = [
        .init(imageName: "star-badge", title: "Displaying news images", description: "If you have a slow internet or low memory, you can   hide all news images from this option.", isUseToggle: true),
        .init(imageName: "star-badge", title: "News images HD", description: "HD images use more internet data, battery power and memory.", isUseToggle: true),
        .init(imageName: "star-badge", title: "Mobile data internet saving", description: "Use the minimum possible of internet while using mobile data (3G, 4G, etc..). This will hide all images  and other things.", isUseToggle: true),
        .init(imageName: "star-badge", title: "Low battery power-saving", description: " Use the minimum possible of power when your  battery is lower than 15%. This will hide all images and other things.", isUseToggle: true),
        .init(imageName: "star-badge", title: "Always use minimum resources", description: "Always use the minimum possible of resources This will hide all images and other things.", isUseToggle: false)
        
    ]
    
    
    static let generalValues: [InnerSettingValues] = [
        .init(imageName: "star-badge", title: "Weather", description: "Enable or disable weather section.", isUseToggle: true),
        .init(imageName: "star-badge", title: "Sport", description: "Enable or disable sport section.", isUseToggle: true),
        .init(imageName: "star-badge", title: "Videos Block", description: "Use the minimum possible of internet while using mobile data (3G, 4G, etc..). This will hide all images  and other things.", isUseToggle: true),
        .init(imageName: "star-badge", title: "Auto clear cache", description: "Enable or disable auto clear cache.", isUseToggle: true),
        .init(imageName: "star-badge", title: "Night Mode", description: "Enable night mode if you are at night or you want to save battery.", isUseToggle: true),
        .init(imageName: "star-badge", title: "Smart Night Mode", description: "Enable night mode if you are at night or you want to save battery.", isUseToggle: true),
        .init(imageName: "star-badge", title: "Default Browser", description: "Click here to choose your default browser.", isUseToggle: true)
        
    ]
    
    
    
    static let othersValues: [InnerSettingValues] = [
        .init(imageName: "star-badge", title: "Privacy policy", description: "Before starting using the app, you need to read our privacy policy.", isUseToggle: true),
        .init(imageName: "star-badge", title: "Support us", description: "Did you like this application ? please we need your support.", isUseToggle: true),
        .init(imageName: "star-badge", title: "Share the App", description: "Have you enjoyed our app? Share it please with your friends and family.", isUseToggle: true),
        .init(imageName: "star-badge", title: "Contact us", description: "You have any question, suggestion or feedback.Just contact us, we read all messages.", isUseToggle: true),
        
        
    ]
}
