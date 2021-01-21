//
//  TagButtonViewModel.swift
//  HunnitLog
//
//  Created by seungwook.jung on 2020/12/15.
//

import Foundation

struct TagButtonViewModel: Identifiable, Hashable {
    let id: UUID = UUID()
    let title: String
    var isSelected: Bool = false
}
