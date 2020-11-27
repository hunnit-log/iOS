//
//  AchievementSetupView.swift
//  HunnitLog
//
//  Created by seungwook.jung on 2020/11/27.
//

import SwiftUI

struct AchievementSetupView: View {
    private enum Constants {
        static let nextButtonTitle: String = "다음"
        static let nextButtonHeight: CGFloat = 93
        static let nextButtonFont: Font = .system(size: 18, weight: .medium)
        static let nextButtonLineSpaceing: CGFloat = -0.54
    }
    
    let buttonAction: (() -> Void) = {
        // TODO: - 버튼 액션 추가
    }
    
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack(alignment: .bottom) {
                // MARK: - Navigation View
                NavigationView {
                    // TODO: - 여기 뷰 구성
                    Text("Hello World")
                }.padding(.bottom, Constants.nextButtonHeight + geometry.safeAreaInsets.bottom)
                
                // MARK: - Bottom Button
                Button(action: self.buttonAction) {
                    Text(Constants.nextButtonTitle)
                        .foregroundColor(CustomColor.black)
                        .font(Constants.nextButtonFont)
                        .kerning(Constants.nextButtonLineSpaceing)
                }
                .frame(maxWidth: .infinity,
                       maxHeight: Constants.nextButtonHeight,
                       alignment: .center)
                .padding(.bottom, geometry.safeAreaInsets.bottom)
                .background(CustomColor.yellow)
            }.edgesIgnoringSafeArea(.bottom)
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
