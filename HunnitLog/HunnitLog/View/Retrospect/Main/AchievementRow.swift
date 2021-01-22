//
//  AchievementRow.swift
//  HunnitLog
//
//  Created by Kang, Su Jin (강수진) on 2020/11/19.
//

import SwiftUI

struct AchievementRow<Content: CardContentable>: View {
    @State var isShowingSheet = false
    
    let content: Content
    var body: some View {
        content
            .modifier(ShadowCard())
            .padding(.top, 20)
            .padding(.bottom, 26)
            .onTapGesture {
                isShowingSheet = true
            }
            .sheet(isPresented: $isShowingSheet) {
                AchievementRateModalView()
            }
    }
}

struct AchievementRow_Previews: PreviewProvider {
    static var previews: some View {
        AchievementRow(content: AchievementContent(period: "2020. 11. 01 - 2020. 1. 29",
                                                   achievementRate: 89))
    }
}
