//
//  RetrospectView.swift
//  HunnitLog
//
//  Created by Kang, Su Jin (강수진) on 2020/11/19.
//

import SwiftUI

//todo navigation 다음 뷰로 넘기기. RetrospectDetailView로 말이쥐
struct RetrospectView: View {

    init() {
        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.backgroundColor = UIColor(CustomColor.bgColor)
        navigationAppearance.shadowColor = .clear
        UINavigationBar.appearance().standardAppearance = navigationAppearance
        //SwiftUI의 모든 list는 UITableView를 내부적으로 사용. 따라서 tableView의 background color를 clear로 바꿔줘야 원하는대로 background color 가 세팅됨
        UITableView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView {
            List {
                AchievementRow(content: AchievementContent(period: "2020. 11. 01 - 2020. 1. 29",
                                                           achievementRate: 89))
                    .padding(.horizontal, 33)
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(CustomColor.bgColor)
                
                RetrospectRow(lineType: .bottomHalf,
                              date: ("12/29", "월요일"),
                              content: ToBeWrittenContent())
                    .padding(.horizontal, 33)
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(CustomColor.bgColor)
                
                RetrospectRow(lineType: .full,
                              date: ("12/29", "월요일"),
                              content: WrittenContent(period: "2020.10.21 - 2020.11.02",
                                                      title: "다섯번째 회고록",
                                                      achievementRate: 25))
                    .padding(.horizontal, 33)
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(CustomColor.bgColor)
                
                RetrospectRow(lineType: .full,
                              date: ("12/21", "월요일"),
                              content: UnwrittenContent())
                    .padding(.horizontal, 33)
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(CustomColor.bgColor)
                
                MonthFlagRow(lineType: .topHalf, date: "2020.12")
                    .padding(.horizontal, 33)
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(CustomColor.bgColor)
                
            }
            .background(CustomColor.bgColor.edgesIgnoringSafeArea(.bottom))
            .navigationBarTitle("회고록", displayMode: .inline)
            .onAppear(perform: {
                UITableView.appearance().separatorStyle = .none
            })
        }
       
    }
}

struct RetrospectView_Previews: PreviewProvider {
    static var previews: some View {
        RetrospectView()
    }
}

