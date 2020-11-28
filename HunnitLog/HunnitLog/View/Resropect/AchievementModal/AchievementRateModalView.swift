//
//  AchievementRateModalView.swift
//  HunnitLog
//
//  Created by Kang, Su Jin (강수진) on 2020/11/25.
//

import SwiftUI

struct AchievementRateModalView: View {
    // MARK: - 더미데이터
    let title: String = "2020. 11. 01 - 2020. 1. 29"
    let totalPercentage = 89
    
    var achievements = [Achievement(title: "올해 안에 연애하기", percentage: 65),
                        Achievement(title: "운전면허를 따고 제주도가서 혼자 배낭여행 하기", percentage: 65),
                        Achievement(title: "몸무게 10kg 줄이기", percentage: 35),
                        Achievement(title: "토익 900점 찍기", percentage: 100),
                        Achievement(title: "올해 안에 연애하기, 올해 안에 연애하기", percentage: 100),
                        Achievement(title: "올해 안에 연애하기", percentage: 65),
                        Achievement(title: "운전면허를 따고 제주도가서 혼자 배낭여행 하기", percentage: 65),
                        Achievement(title: "몸무게 10kg 줄이기", percentage: 35),
                        Achievement(title: "토익 900점 찍기", percentage: 100),
                        Achievement(title: "올해 안에 연애하기", percentage: 100),
    ]
    
    private enum Constants {
        static let rowHorizontalPadding: CGFloat = 33
        static let listBottomPadding: CGFloat = 34
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
                Section(header: AchievementModalHeader(title: title)) {
                    AchievementModalPercentageView(with: totalPercentage)
                    ForEach(achievements) { (achievement) in
                        AchievementModalRow(title: achievement.title, percentage: achievement.percentage)
                            .padding(.horizontal, Constants.rowHorizontalPadding)
                    }
                }
            }
            .padding(.bottom, Constants.listBottomPadding)
        }
    }
}

//MARK: - 더미데이터 구조체
struct Achievement: Identifiable {
    let title: String
    let percentage: Int
    let id = UUID()
}

struct AchievementRateModalView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementRateModalView()
    }
}
