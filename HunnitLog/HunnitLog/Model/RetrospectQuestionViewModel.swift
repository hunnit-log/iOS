//
//  RetrospectQuestionViewModel.swift
//  HunnitLog
//
//  Created by seungwook.jung on 2020/12/01.
//

import Foundation

struct RetrospectQuestionViewModel: Identifiable {
    let id: UUID = UUID()
    var isSelected: Bool = false
    var question: String
}
