//
//  ShadowCard.swift
//  HunnitLog
//
//  Created by Kang, Su Jin (강수진) on 2020/11/19.
//

import SwiftUI

struct ShadowCard: ViewModifier {
    private enum Constants {
        static let backgroundCornerRadius: CGFloat = 13
        static let backgroundShadowColor: Color = Color(red: 123/255,
                                                        green: 123/255,
                                                        blue: 123/255,
                                                        opacity: 0.15)
        static let backgroundShadowRadius: CGFloat = 6
    }
    
    func body(content: Content) -> some View {
        content
            .background(Rectangle()
                            .fill(Color.white)
                            .cornerRadius(Constants.backgroundCornerRadius)
                            .shadow(color: Constants.backgroundShadowColor,
                                    radius: Constants.backgroundShadowRadius,
                                    x: 0.0,
                                    y: 0.0))
    }
}

struct RatioShadowCard: ViewModifier {
    let ratioWidth: CGFloat
    let ratioHeight: CGFloat
    
    func body(content: Content) -> some View {
        GeometryReader(content: { geometry in
            content
                .frame(width: geometry.size.width)
                .frame(height: ratioHeight/ratioWidth*geometry.size.width)
                .modifier(ShadowCard())
        })
        .aspectRatio(ratioWidth/ratioHeight, contentMode: .fit)
    }
}
