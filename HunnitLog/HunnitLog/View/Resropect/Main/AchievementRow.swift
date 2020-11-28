//
//  AchievementRow.swift
//  HunnitLog
//
//  Created by Kang, Su Jin (강수진) on 2020/11/19.
//

import SwiftUI

struct AchievementRow<Content: CardContentable>: View {
    var content: Content
    @State var isShowingSheet = false
    
    var body: some View {
        ShadowCard(ratio: 309/72, content: content)
           .padding(.vertical, 12)
            .onTapGesture {
                isShowingSheet = true
            }
            .sheet(isPresented: $isShowingSheet) {
                AchievementRateModalView()
            }
    }
}
