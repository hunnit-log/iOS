//
//  RetrospectRow.swift
//  HunnitLog
//
//  Created by Kang, Su Jin (강수진) on 2020/11/19.
//

import SwiftUI

//MARK: - 날짜
fileprivate struct Date: View {
    let monthDay: String
    let weekDay: String

    var body: some View {
        VStack {
            Text(monthDay)
                .font(.system(size: 18))
                .fontWeight(.semibold)
                .foregroundColor(.black)
            Text(weekDay)
                .font(.system(size: 14))
                .fontWeight(.semibold)
                .foregroundColor(.gray)
        }
        .frame(width: 50)
    }
}

//MARK: - flag (회색 선 + 노란 원)
fileprivate struct RetrospectCardFlag: View {
    var lineType: LineType
    var date: (monthDay: String, weekDay: String)

    var body: some View {
        Date(monthDay: date.monthDay, weekDay: date.weekDay)
        ZStack {
            HalfableGrayLine(lineType: lineType)

            //yellowCircle
            Circle()
                .stroke(Color.yellow, lineWidth: 3)
                .background(Circle().foregroundColor(Color.white))
                .frame(width: 11, height: 11)
        }
    }
}

//MARK: - RetrospectCard
fileprivate struct RetrospectCard<Content: CardContentable>: View {
    let content: Content
    var body: some View {
        ShadowCard(ratio: 238/129, content: content)
           .padding(.vertical, 14)
    }
}

//MARK: - Row
struct RetrospectRow<Content: CardContentable>: View {
    var lineType: LineType
    var date: (monthDay: String, weekDay: String)
    var content: Content

    var body: some View {
        HStack(spacing: 0) {
            RetrospectCardFlag(lineType: lineType, date: date)
            RetrospectCard(content: content)
        }
    }
}
