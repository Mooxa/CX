//
//  LangueViewModel.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 02/06/2021.
//

import Foundation

class LangueViewModel: ObservableObject {
  let service =  LanguageRemoteDataSource()
    @Published  var language: [Language] = []


  func fetch() {
    service.getLanguageList {result in

        self.language = try! result.get()

    }
  }
}
