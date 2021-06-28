//
//  Breaking_NewsApp.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 01/06/2021.
//

import SwiftUI
import Firebase
import GoogleSignIn


@main
struct Breaking_NewsApp: App {

    
    let persistenceController = PersistenceController.shared
    
    @Environment(\.scenePhase) var scenePhase
    
    @Environment(\.managedObjectContext) var managedObjectContext
    init() {
        setupAuthentication()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
    }
}


extension Breaking_NewsApp {
  private func setupAuthentication() {
    FirebaseApp.configure()
    GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
  }
}
