//
//  HunnitLogApp.swift
//  HunnitLog
//
//  Created by Kang, Su Jin (강수진) on 2020/11/18.
//

import SwiftUI

@main
struct HunnitLogApp: App {
    private enum Constants {
        static let splashDuration: Double = 2
    }
    
    @State var isApplicationActive:Bool = false
    
    var body: some Scene {
        WindowGroup {
            VStack {
                if self.isApplicationActive {
                    AchievementSetupView()
                } else {
                    SplashView()
                }
            }.onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + Constants.splashDuration) {
                    self.isApplicationActive = true
                }
            }
        }
    }
}
