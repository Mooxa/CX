//
//  LanguageRowView.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 01/06/2021.
//

import SwiftUI

struct LanguageRowView: View {
    @State var username: String = ""
    var language: Language
    var body: some View {
        HStack(alignment: .center){
            Text(language.nameEdition)
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
                .padding(EdgeInsets(top: 8, leading:8,
                                    bottom: 8, trailing: 8))
                .frame(width: 250)
                .background(Parallelogram()
                                .cornerRadius(25)
                                .foregroundColor(Color.gray.opacity(0.2))
                )
            RemoteImage(url: language.iconEdition)
                .mask(Parallelogram().cornerRadius(25))
                .frame(width: 100, height: 35)
        }
        .frame(width: .infinity)
    }
}

//struct LanguageRowView_Previews: PreviewProvider {
//    static var previews: some View {
////        LanguageRowView(nameCountry: "Kenya",  photoCountry: "https://lh3.googleusercontent.com/-kCJU-Uz4bhE/YH72OwyQ4xI/AAAAAAAATys/L065s9FCi5cjRluqtXB0jBy2icaXD2E_wCLcBGAsYHQ/s16000/ke.png")
//    }
//}
