//
//  DetailSummary.swift
//  HunnitLog
//
//  Created by Kang, Su Jin (강수진) on 2020/12/04.
//

import SwiftUI

struct DetailSummary: View {
    let period: String
    let averageEvaluation: String
    let averageAchievement: Int
    let feeling: Feeling
    
    private enum Constants {
        static let periodFont: Font = .system(size: 18, weight: .semibold)
        static let periodBottom: CGFloat = 19
        
        static var feelingWidth: CGFloat = 75
        static var feelingHeight: CGFloat = 75
        static var feelingBottom: CGFloat = 20.5
        
        static let averageEvaluationTitle = "평균 점수"
        static let averageEvaluationTitleFont: Font = .system(size: 16)
        static let averageEvaluationTitleBottom: CGFloat = 8
        static let averageEvaluationFont: Font = .system(size: 16, weight: .bold)
        
        static let separatorWidth: CGFloat = 0.5
        static let separatorHeight: CGFloat = 54
        
        static let averageAchievementTitle = "평균 달성률"
        static let averageAchievementTitleFont: Font = .system(size: 15)
        static let averageAchievementTitleBottom: CGFloat = 3
        static let averageAchievementFont: Font = .system(size: 23, weight: .bold)
        
        static let topPadding: CGFloat = 38
        static let bottomPadding: CGFloat = 25
    }
    
    
    var body: some View {
        VStack(spacing: 0) {
            Text(period)
                .font(Constants.periodFont)
                .foregroundColor(CustomColor.black)
                .padding(.bottom, Constants.periodBottom)
            
            feeling.icon
                .resizable()
                .frame(width: Constants.feelingWidth,
                       height: Constants.feelingHeight)
                .padding(.bottom, Constants.feelingBottom)
            
            HStack(alignment:.top, spacing: 0) {
                HStack {
                    Spacer()
                    VStack {
                        Text(Constants.averageEvaluationTitle)
                            .font(Constants.averageEvaluationTitleFont)
                            .foregroundColor(CustomColor.black)
                            .padding(.bottom, Constants.averageEvaluationTitleBottom)
                        Text(averageEvaluation)
                            .font(Constants.averageEvaluationFont)
                            .foregroundColor(CustomColor.black)
                    }
                    Spacer()
                }
                
                //separator
                Rectangle()
                    .foregroundColor(CustomColor.gray)
                    .frame(width: Constants.separatorWidth,
                           height: Constants.separatorHeight)
                
                HStack {
                    Spacer()
                    VStack {
                        Text(Constants.averageAchievementTitle)
                            .font(Constants.averageAchievementTitleFont)
                            .foregroundColor(CustomColor.black)
                            .padding(.bottom, Constants.averageAchievementTitleBottom)
                        Text("\(averageAchievement)%")
                            .font(Constants.averageAchievementFont)
                            .foregroundColor(CustomColor.black)
                    }
                    Spacer()
                }
            }
        }
        .padding(.top, Constants.topPadding)
        .padding(.bottom, Constants.bottomPadding)
        .modifier(HunnitSummary())
    }
}
