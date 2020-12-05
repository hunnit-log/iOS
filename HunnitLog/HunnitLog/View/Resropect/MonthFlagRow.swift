//
//  MonthFlagRow.swift
//  HunnitLog
//
//  Created by Kang, Su Jin (강수진) on 2020/11/19.
//

import SwiftUI

struct MonthFlagRow: View {
    var lineType: LineType
    let date: String

    var body: some View {
        ZStack(alignment: .leading) {
            HalfableGrayLine(lineType: lineType)
                .padding(.leading, 50)
            HStack {
                Text(date)
                    .font(.system(size: 20))
                    .padding(.vertical, 5)
                    .padding(.horizontal, 11)
                    .background(Rectangle().fill(Color.yellow))
                    .cornerRadius(8)
                    .padding(.vertical, 15)
                Spacer()
            }
        }
    }
}
