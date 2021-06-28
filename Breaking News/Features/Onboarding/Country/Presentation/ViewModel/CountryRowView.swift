//
//  CountryRowView.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 02/06/2021.
//

import SwiftUI

struct CountryRowView: View {
    var country: Country

    var body: some View {
        HStack(alignment: .center){
            Text(country.nameCountry != "" ? country.nameCountry : country.countryCode)
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
                .padding(EdgeInsets(top: 8, leading:8,
                                    bottom: 8, trailing: 8))
                .frame(width: 250)
                .background(Parallelogram()
                                .cornerRadius(25)
                                .foregroundColor(Color.gray.opacity(0.2))
                )
            if country.photoCountry != "" {
                RemoteImage(url: country.photoCountry)
                    .frame(width: 100, height: 35)
            }
            
        }
        .frame(width: .infinity)
    }
}

//struct CountryRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        CountryRowView()
//    }
//}
