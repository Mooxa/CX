//
//  MoreView.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 17/06/2021.
//

import SwiftUI

struct MoreListView: View {
    var body: some View {
        NavigationView {
            List{
                ForEach(Option.items, id: \.id) { item in
                    MoreItemRow(item: item)
                }
            }
        }
        .navigationTitle("More")
        .navigationViewStyle(DefaultNavigationViewStyle())
        .listStyle(InsetGroupedListStyle())
    }
}

struct MoreView_Previews: PreviewProvider {
    static var previews: some View {
        MoreListView()
    }
}
