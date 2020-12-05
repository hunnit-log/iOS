//
//  HalfableGrayLine.swift
//  HunnitLog
//
//  Created by Kang, Su Jin (강수진) on 2020/11/19.
//

import SwiftUI

fileprivate struct GrayLine: View {
    let isClear: Bool
    var body: some View {
        Rectangle()
            .foregroundColor(isClear ? .clear : .gray)
            .frame(width: 1.0)
            .padding(.horizontal, 17)
    }
}

enum LineType {
    case topHalf
    case bottomHalf
    case full
}

struct HalfableGrayLine: View {
    let isTopLineClear: Bool
    let isBottomLineClear: Bool
    
    init(lineType: LineType) {
        switch lineType {
        case .topHalf:
            isTopLineClear = false
            isBottomLineClear = true
        case .bottomHalf:
            isTopLineClear = true
            isBottomLineClear = false
        case .full:
            isTopLineClear = false
            isBottomLineClear = false
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            GrayLine(isClear: isTopLineClear)
            GrayLine(isClear: isBottomLineClear)
        }
    }
}

struct HalfableGrayLine_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
