//
//  ContentView.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 01/06/2021.
//

import SwiftUI

struct ContentView: View {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate


    var langueUserSettings = LangueUserSettings()
    
    var body: some View {
        if langueUserSettings.country == ""{
            OnboardingView()
        } else{
            HomeView()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
           

    }
}
