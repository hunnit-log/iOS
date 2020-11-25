//
//  GoalList.swift
//  HunnitLog
//
//  Created by 초이 on 2020/11/26.
//

import SwiftUI

struct GoalList: View {
    // MARK: - 더미데이터
    @State private var goals = [
        goal(title: "올해 안에 연애하기라랄ㄹ라 라라아아아아아아아아", achievement: 25),
        goal(title: "운전면허증 따기", achievement: 25),
        goal(title: "토익 900점 찍기", achievement: 20),
        goal(title: "올해 안에 연애하기라랄ㄹ라 라라아아아아아아아아", achievement: 30)
    ]
    
    @State private var achievedGoals = [
        achievedGoal(title: "올해 안에 연애하기라랄ㄹ라 라라아아아아아아아아", achievement: 100),
        achievedGoal(title: "토익 900점 찍기", achievement: 100),
        achievedGoal(title: "올해 안에 연애하기라랄ㄹ라 라라아아아아아아아아", achievement: 100)
    ]
    
    // MARK: - body
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(goals, id:\.self) { obj in
                    GoalRow(title: obj.title, achievement: obj.achievement)
                }
                ForEach(achievedGoals, id:\.self) { obj in
                    AchievedGoalRow(title: obj.title, achievement: obj.achievement)
                }
            }
        }
        .padding(.horizontal, 33)
    }
}

// MARK: - 더미데이터 구조체
struct goal: Hashable {
    var title = ""
    var achievement = 0
    var id = UUID()
}

struct achievedGoal: Hashable {
    var title = ""
    var achievement = 0
    var id = UUID()
}

struct GoalList_Previews: PreviewProvider {
    static var previews: some View {
        GoalList()
    }
}
