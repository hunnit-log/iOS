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
        content.modifier(RatioShadowCard(ratioWidth: 238, ratioHeight: 129))
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
                .padding(.vertical, 14)
        }
    }
}

struct RetrospectRow_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 0) {
            RetrospectRow(lineType: .bottomHalf,
                          date: ("12/29", "월요일"),
                          content: ToBeWrittenContent())
            RetrospectRow(lineType: .full,
                          date: ("12/29", "월요일"),
                          content: WrittenContent(period: "2020.10.21 - 2020.11.02",
                                                  title: "다섯번째 회고록",
                                                  achievementRate: 25))
            RetrospectRow(lineType: .full,
                          date: ("12/21", "월요일"),
                          content: UnwrittenContent())
        }
    }
}
