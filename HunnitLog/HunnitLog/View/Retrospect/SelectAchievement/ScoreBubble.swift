//
//  ScoreBubble.swift
//  HunnitLog
//
//  Created by Kang, Su Jin (강수진) on 2020/12/06.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        
        return path
    }
}

struct ScoreBubble: View {
    private enum Constants {
        static let titleFont: Font = .system(size: 16, weight: .semibold)
        static let titleHorizontalPadding: CGFloat = 15
        static let titleVerticalPadding: CGFloat = 5
        
        static let cornerRadius: CGFloat = 10
        
        static let triangleWidth: CGFloat = 12
        static let triangleHeight: CGFloat = 11
        static let triangleRotationDegree: Double = 180
        
    }
    
    private let title: String
    
    init(_ title: String) {
        self.title = title
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Text(title)
                .font(Constants.titleFont)
                .foregroundColor(CustomColor.black)
                .padding(.horizontal, Constants.titleHorizontalPadding)
                .padding(.vertical, Constants.titleVerticalPadding)
                .background(CustomColor.yellow)
                .cornerRadius(Constants.cornerRadius)
            Triangle()
                .fill(CustomColor.yellow)
                .frame(width: Constants.triangleWidth,
                       height: Constants.triangleHeight)
                .rotationEffect(.degrees(Constants.triangleRotationDegree))
        }
    }
}

struct ScoreBubble_Previews: PreviewProvider {
    static var previews: some View {
        ScoreBubble("75")
    }
}
