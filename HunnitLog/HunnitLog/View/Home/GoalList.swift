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
        Goal(title: "올해 안에 연애하기라랄ㄹ라 라라아아아아아아아아", achievement: 25),
        Goal(title: "운전면허증 따기", achievement: 25),
        Goal(title: "토익 900점 찍기", achievement: 20),
        Goal(title: "올해 안에 연애하기라랄ㄹ라 라라아아아아아아아아", achievement: 30)
    ]
    
    @State private var achievedGoals = [
        AchievedGoal(title: "올해 안에 연애하기라랄ㄹ라 라라아아아아아아아아", achievement: 100),
        AchievedGoal(title: "토익 900점 찍기", achievement: 100),
        AchievedGoal(title: "올해 안에 연애하기라랄ㄹ라 라라아아아아아아아아", achievement: 100)
    ]
    
    // MARK: - body
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(goals, id:\.self) { goal in
                    GoalRow(title: goal.title, achievement: goal.achievement)
                }
                ForEach(achievedGoals, id:\.self) { goal in
                    AchievedGoalRow(title: goal.title, achievement: goal.achievement)
                }
            }
        }
        .padding(.horizontal, 33)
    }
}

// MARK: - 더미데이터 구조체
struct Goal: Hashable {
    var title = ""
    var achievement = 0
    var id = UUID()
}

struct AchievedGoal: Hashable {
    var title = ""
    var achievement = 0
    var id = UUID()
}

struct GoalList_Previews: PreviewProvider {
    static var previews: some View {
        GoalList()
    }
}
