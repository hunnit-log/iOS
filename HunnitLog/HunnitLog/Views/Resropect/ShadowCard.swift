//
//  ShadowCard.swift
//  HunnitLog
//
//  Created by Kang, Su Jin (강수진) on 2020/11/19.
//

import SwiftUI

struct ShadowCard<Content>: View where Content: CardContentable {
    let ratio: CGFloat
    let content: Content

    var body : some View {
        ZStack {
            Color(.white)
            content
        }
        .cornerRadius(13)
        .shadow(color: Color(red: 123/255, green: 123/255, blue: 123/255, opacity: 0.15), radius: 6, x: 0.0, y: 0.0)
        .aspectRatio(ratio, contentMode: .fit)
    }
}


