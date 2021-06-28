//
//  AppDelegate.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 18/06/2021.
//

import Foundation
import UIKit
import FBSDKCoreKit

//@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application( _ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? ) -> Bool {
        ApplicationDelegate.shared.application( application, didFinishLaunchingWithOptions: launchOptions )
        return true
        
    }
    func application( _ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:] ) -> Bool { ApplicationDelegate.shared.application( app, open: url, sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplication.OpenURLOptionsKey.annotation] )
        
    }
}


  





// Swift // // AppDelegate.swift import UIKit

    
