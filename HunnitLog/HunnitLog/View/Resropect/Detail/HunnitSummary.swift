//
//  HunnitSummary.swift
//  HunnitLog
//
//  Created by Kang, Su Jin (강수진) on 2020/12/04.
//

import SwiftUI

struct HunnitSummary: ViewModifier {
    
    private enum Constants {
        static let title = "허닛's 총정리"
        static let titleFont: Font = .system(size: 16, weight: .medium)
        static let titleVerticalPadding: CGFloat = 7
        static let titleHorizontalPadding: CGFloat = 11
        static let titleCornerRadius: CGFloat = 8
        static let titleOffset: CGFloat = 17
        
        static let backgroundCornerRadius: CGFloat = 13
        static let backgroundShadowColor: Color = Color(red: 123/255,
                                                        green: 123/255,
                                                        blue: 123/255,
                                                        opacity: 0.15)
        static let backgroundShadowRadius: CGFloat = 6
    }
    
    let title: some View = Text(Constants.title)
        .font(Constants.titleFont)
        .foregroundColor(CustomColor.black)
        .padding(.horizontal, Constants.titleHorizontalPadding)
        .padding(.vertical, Constants.titleVerticalPadding)
        .background(CustomColor.yellow)
        .cornerRadius(Constants.titleCornerRadius)
        .offset(y: Constants.titleOffset) //TODO: - Can I handle it dynamically?
        .zIndex(1)
    func body(content: Content) -> some View {
        VStack(spacing: 0) {
            title
            content
                .modifier(ShadowCard())
        }
    }
}
