//
//  SelectAchievementRow.swift
//  HunnitLog
//
//  Created by Kang, Su Jin (강수진) on 2020/12/06.
//

import SwiftUI

struct SelectAchievementRow: View {
   let title: String
   @State var percentage: Double
    
    private enum Constants {
        static let titleTop: CGFloat = 17
        static let titleBottom: CGFloat = 9
        static let titleFont: Font = .system(size: 16, weight: .bold)
        
        static let iconWidth: CGFloat = 25
        static let iconHeight: CGFloat = iconWidth
        static let iconVerticalPadding: CGFloat = 14
        
        static let scoreBubbleHeight: CGFloat = 39
        static let scoreBubbleBottom: CGFloat = 3
        
        static let achievementBarHeight: CGFloat = 25
        
        static let bottomPadding: CGFloat = 25
        static let bottomLineHeight: CGFloat = 0.5
        static let bottomLineColor: Color = Color(red: 207/255,
                                                  green: 221/255,
                                                  blue: 221/255)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(Constants.titleFont)
                .foregroundColor(CustomColor.black)
                .padding(.top, Constants.titleTop)
                .padding(.bottom, Constants.titleBottom)
            
            //MARK: - stepper
            GeometryReader(content: { geometry in
                HStack(spacing: Constants.iconVerticalPadding) {
                    let barWidth = geometry.size.width
                        - (Constants.iconWidth + Constants.iconVerticalPadding) * 2
                    let scoreBubbleBaseOffset: CGFloat = -barWidth / 2
                    let scoreBubbleOffset = scoreBubbleBaseOffset
                        + CGFloat(percentage / 100) * barWidth
                    
                    VStack {
                        Spacer()
                        StepperButton(type: .minus,
                                      percentage: $percentage)
                    }
                    
                    VStack(spacing: 0) {
                        ScoreBubble(Int(percentage).description)
                            .padding(.bottom, Constants.scoreBubbleBottom)
                            .offset(x: scoreBubbleOffset)
                        
                        AchievementBar(width: barWidth,
                                       height: Constants.achievementBarHeight,
                                       achievement: percentage,
                                       accentColor: CustomColor.coolGray)
                    }
                    
                    VStack {
                        Spacer()
                        StepperButton(type: .plus,
                                      percentage: $percentage)
                    }
                }
            })
            .frame(height: Constants.scoreBubbleHeight
                    + Constants.scoreBubbleBottom
                    + Constants.achievementBarHeight)
            
            .padding(.bottom, Constants.bottomPadding)
            
            //MARK: - bottom line
            Rectangle()
                .frame(height: Constants.bottomLineHeight)
                .foregroundColor(Constants.bottomLineColor)
        }
    }
}

struct SelectAchievementRow_Previews: PreviewProvider {
    static var previews: some View {
        SelectAchievementRow(title: "코딩하기", percentage: 40)
    }
}
