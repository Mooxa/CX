//
//  NotificationNum.swift
//  Breaking News
//
//  Created by Mouhamed Dieye on 04/06/2021.
//

import SwiftUI

struct NotificationNumLabel: View {
    @Binding var number : Int
    var body: some View {
        ZStack {
            Capsule().fill(Color.red).frame(width: 20 * CGFloat(numOfDigits()), height: 35, alignment: .topTrailing).position(CGPoint(x: 150, y: 0))
            Text("\(number)")
                .foregroundColor(Color.white)
                .font(Font.system(size: 20).bold()).position(CGPoint(x: 150, y: 0))
        }
    }
    func numOfDigits() -> Float {
        let numOfDigits = Float(String(number).count)
        return numOfDigits == 1 ? 1.5 : numOfDigits
    }
}

//struct NotificationNumLabel_Previews: PreviewProvider {
//    static var previews: some View {
//        NotificationNumLabel(number: $number)
//    }
//}
