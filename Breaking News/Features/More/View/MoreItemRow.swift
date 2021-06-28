//
//  MoreItemRow.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 17/06/2021.
//

import SwiftUI

struct MoreItemRow: View {
    var item: Option
    var body: some View {
        HStack {
            Image(item.imageName)
                .resizable()
                .frame(width:40, height: 40)
                .aspectRatio(contentMode: .fit)
                .padding(.trailing, 8)
            VStack(alignment: .leading) {
                Text(item.title).bold()
                
                Text(item.description)
                    .foregroundColor(.gray)
                    .font(.subheadline)
            }

        }
        .padding()
    }
}

struct MoreItemRow_Previews: PreviewProvider {
    static var previews: some View {
        MoreItemRow(item: Option.items[4])
    }
}
