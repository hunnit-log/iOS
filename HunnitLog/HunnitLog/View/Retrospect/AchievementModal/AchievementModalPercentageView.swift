//
//  AchievementModalPercentageView.swift
//  HunnitLog
//
//  Created by Kang, Su Jin (강수진) on 2020/11/28.
//

import SwiftUI

struct AchievementModalPercentageView: View {
    private let percentage: Int
    
    private enum Constants {
        static let wholeAchievementRateTopPadding: CGFloat = 20
        static let wholeAchievementRateBottomPadding: CGFloat = 7
        
        static let percentageFont: Font = .system(size: 30)
        static let percentageHeight: CGFloat = 47
        static let percentageBottomPadding: CGFloat = 13
        
        static let separatorHeight: CGFloat = 7
        static let separatorBottomPadding: CGFloat = 30
        
        static let perAchievementRateBottomPadding: CGFloat = 13
    }
    
    init(with percentage: Int) {
        self.percentage = percentage
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Text("전체 달성률")
                .modifier(YellowBackgroundTextStyle())
                .padding(.top, Constants.wholeAchievementRateTopPadding)
                .padding(.bottom, Constants.wholeAchievementRateBottomPadding)
            
            Text("\(percentage)%")
                .font(Constants.percentageFont)
                .fontWeight(.bold)
                .foregroundColor(CustomColor.black)
                .frame(height: Constants.percentageHeight)
                .padding(.bottom, Constants.percentageBottomPadding)
            
            //separator
            Rectangle()
                .frame(height: Constants.separatorHeight)
                .foregroundColor(CustomColor.lightGray)
                .padding(.bottom, Constants.separatorBottomPadding)
            
            Text("목표별 달성률")
                .modifier(YellowBackgroundTextStyle())
                .padding(.bottom, Constants.perAchievementRateBottomPadding)
        }
    }
}


private struct YellowBackgroundTextStyle: ViewModifier {
    private enum Constants {
        static let yellowBackgroundHeight: CGFloat = 8
        static let yellowBackgroundCornerRadius: CGFloat = 5
        
        static let titleFont: Font = .system(size: 18, weight: .medium)
    }
    
    private let yellowBackground: some View = Rectangle()
        .frame(height: Constants.yellowBackgroundHeight)
        .foregroundColor(CustomColor.yellow)
        .cornerRadius(Constants.yellowBackgroundCornerRadius)
    
    func body(content: Content) -> some View {
        content
            .font(Constants.titleFont)
            .foregroundColor(CustomColor.black)
            .background(yellowBackground,
                        alignment: .bottom)
    }
}
