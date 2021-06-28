//
//  SettingsRow.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 17/06/2021.
//

import SwiftUI

struct SettingsRow: View {
    var item: InnerSettingValues
    var body: some View {
        HStack {
            Image("star-badge")
                .resizable()
                .cornerRadius(20)
                .frame(width:40, height: 40)
                .clipped()
                .aspectRatio(contentMode: .fit)
                .padding(.trailing, 8)
            VStack(alignment: .leading) {
                Text("landmark.title").bold()
               
                Text("landmark.country").foregroundColor(.gray)
            }
            if item.isUseToggle{
                Toggle(isOn: /*@START_MENU_TOKEN@*/.constant(true)/*@END_MENU_TOKEN@*/, label: {
                })
            }

            
        }
        .padding()

    }
    

}

//struct SettingsRow_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsRow(item: Option.notificationsValues)
//    }
//}
