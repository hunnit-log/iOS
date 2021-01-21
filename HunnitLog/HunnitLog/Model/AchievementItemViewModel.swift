//
//  AchievementItemViewModel.swift
//  HunnitLog
//
//  Created by seungwook.jung on 2020/12/01.
//

import Foundation

struct AchievementItemViewModel: Identifiable {
    let id: UUID = UUID()
    var editable: Bool
    var title: String
    var letterCount: Int {
        self.title.count
    }
}
