//
//  AchievementSetupView.swift
//  HunnitLog
//
//  Created by seungwook.jung on 2020/11/27.
//

import SwiftUI

struct AchievementSetupView: View {
    
    init() {
        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.backgroundColor = .white
        navigationAppearance.shadowColor = .clear
        UINavigationBar.appearance().standardAppearance = navigationAppearance
    }
    
    var body: some View {
        GeometryReader(content: { geometry in
            NavigationView {
                AchievementDateView(geometry: geometry)
            }
        })
    }
}

struct AchievementSetupView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AchievementSetupView()
            AchievementSetupView()
                .previewDevice("iPhone 12 Pro")
        }
    }
}
