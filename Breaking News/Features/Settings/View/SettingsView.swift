//
//  SettingsView.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 17/06/2021.
//

import SwiftUI

struct ProfileView: View{
    var body: some View{
        VStack{
            Image(systemName: "person.circle.fill")
                .resizable()
                .cornerRadius(20)
                .frame(width:100, height: 100)
                .clipped()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.gray)
            
            Button(action: {
            }) {
                Text("SIGN-IN")
                    .padding()
                    .frame(width: 100, height: 55)
                    .background(Color.red)
                    .cornerRadius(10)
                    .foregroundColor(Color.white)
                
            }
            Text("Login to join the community").foregroundColor(.gray)
            
        }
    }
}
struct SettingsView: View {
    @State private var toggleStatus = true
    
    
    var body: some View {
        NavigationView {
            VStack{
                ProfileView()
                    .frame(width: .infinity, height: 200)
                List{
                    ForEach(Setting.settings, id: \.id) { section in
                        Section(header: Text(section.title)){
                            ForEach(section.values) { item in
                                SettingsRow(item: item)
                            }
                        }
                        
                    }
                }
            }
            .navigationTitle("Settings")
            .navigationViewStyle(DefaultNavigationViewStyle())
            .listStyle(InsetGroupedListStyle())
           
        }
        

        
        
    }
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
