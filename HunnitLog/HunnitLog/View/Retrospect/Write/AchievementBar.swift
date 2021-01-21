//
//  AchievementBar.swift
//  HunnitLog
//
//  Created by Kang, Su Jin (강수진) on 2020/12/05.
//

import SwiftUI

struct AchievementBar: View {
    private let width: CGFloat
    private let height: CGFloat
    private let achievement: Double
    private let accentColor: Color
    
    private enum Constants {
        static let cornerRadius: CGFloat = 4
    }
    
    init(width: CGFloat, height: CGFloat, achievement: Double, accentColor: Color = CustomColor.yellow) {
        self.width = width
        self.height = height
        self.achievement = achievement
        self.accentColor = accentColor
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(CustomColor.lightGray)
                .frame(width: width, //todo dynamic?
                    height: height)
                .cornerRadius(Constants.cornerRadius)
            Rectangle()
                .foregroundColor(accentColor)
                .frame(width: (CGFloat(achievement)/100)*width,
                       height: height)
                .cornerRadius(Constants.cornerRadius)
        }
    }
}
