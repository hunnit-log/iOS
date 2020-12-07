//
//  AchievementModalRow.swift
//  HunnitLog
//
//  Created by Kang, Su Jin (강수진) on 2020/11/28.
//

import SwiftUI

struct AchievementModalRow: View {
    private let title: String
    private let percentage: Int
    
    init(title: String, percentage: Int) {
        self.title = title
        self.percentage = percentage
    }
    
    private enum Constants {
        static let font: Font = .system(size: 16)
        static let titleMaxWidth: CGFloat = 174
        static let verticalPadding: CGFloat = 12
        static let bottomLineHeight: CGFloat = 0.5
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(title)
                    .font(Constants.font)
                    .foregroundColor(CustomColor.black)
                    .frame(maxWidth: Constants.titleMaxWidth, alignment: .leading)
                Spacer()
                Text("\(percentage)%")
                    .font(Constants.font)
                    .fontWeight(.bold)
                    .foregroundColor(CustomColor.black)
            }.padding(.vertical, Constants.verticalPadding)
            
            Rectangle()
                .frame(height: Constants.bottomLineHeight)
                .foregroundColor(CustomColor.gray)
        }
    }
}
