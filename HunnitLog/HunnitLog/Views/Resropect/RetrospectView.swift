//
//  RetrospectView.swift
//  HunnitLog
//
//  Created by Kang, Su Jin (강수진) on 2020/11/19.
//

import SwiftUI

struct RetrospectView: View {

    init() {
        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.backgroundColor = .white
        navigationAppearance.shadowColor = .clear
        UINavigationBar.appearance().standardAppearance = navigationAppearance
    }

    var body: some View {
        NavigationView {
            List {
                AchievementRow(content: AchievementContent(period: "2020. 11. 01 - 2020. 1. 29",
                                                           achievementRate: 89))

                    .padding(.horizontal, 33)
                    .listRowInsets(EdgeInsets())

                RetrospectRow(lineType: .bottomHalf,
                              date: ("12/29", "월요일"),
                              content: ToBeWrittenContent())
                    .padding(.horizontal, 33)
                    .listRowInsets(EdgeInsets())

                RetrospectRow(lineType: .full,
                              date: ("12/29", "월요일"),
                              content: WrittenContent(period: "2020.10.21 - 2020.11.02",
                                                      title: "다섯번째 회고록",
                                                      achievementRate: 25))
                    .padding(.horizontal, 33)
                    .listRowInsets(EdgeInsets())

                RetrospectRow(lineType: .full,
                              date: ("12/21", "월요일"),
                              content: UnwrittenContent())
                    .padding(.horizontal, 33)
                    .listRowInsets(EdgeInsets())

                MonthFlagRow(lineType: .topHalf, date: "2020.12")
                    .padding(.horizontal, 33)
                    .listRowInsets(EdgeInsets())
            }
            .navigationBarTitle("회고록", displayMode: .inline)
            .onAppear(perform: {
                UITableView.appearance().separatorStyle = .none
            })
        }
    }
}
