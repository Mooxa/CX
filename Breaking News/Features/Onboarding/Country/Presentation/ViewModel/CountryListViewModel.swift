//
//  CountryListViewModel.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 02/06/2021.
//

import Foundation


class CountryListViewModel: ObservableObject {
     var langueUserSettings = LangueUserSettings()

    
  let service =  CountryRemoteDataSource()
    @Published  var countries: [Country] = []

    func fetch(id: String) {
        service.getCountryList(id: id) {result in
            self.langueUserSettings.language = id
        self.countries = try! result.get()

    }
  }
}
