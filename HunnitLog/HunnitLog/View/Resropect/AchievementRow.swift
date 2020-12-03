//
//  AchievementRow.swift
//  HunnitLog
//
//  Created by Kang, Su Jin (강수진) on 2020/11/19.
//

import SwiftUI

struct AchievementRow<Content: CardContentable>: View {
    let content: Content
    var body: some View {
        content
            .modifier(ShadowCard())
    }
}
