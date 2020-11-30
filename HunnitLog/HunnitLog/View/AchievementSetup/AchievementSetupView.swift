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
        static let nextButtonHeight: CGFloat = 57
        static let nextButtonFont: Font = .system(size: 18, weight: .medium)
        static let nextButtonLineSpaceing: CGFloat = -0.54
    }
    
    @State var isLinkActive: Bool = false
    @State var isNextButtonDisabled: Bool = false // TODO - 하위 뷰들에게 넘겨서 하위뷰에서 버튼 활성화 여부 판단하도록
    
    init() {
        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.backgroundColor = .white
        navigationAppearance.shadowColor = .clear
        UINavigationBar.appearance().standardAppearance = navigationAppearance
    }
    
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack(alignment: .bottom) {
                // MARK: - Navigation View
                NavigationView {
                    AchievementDateView()
                        .background(
                            NavigationLink(
                                destination: AchievementListView(),
                                isActive: $isLinkActive,
                                label: {
                                    EmptyView()
                                })
                                .navigationBarTitle("", displayMode: .inline)
                                .hidden())
                }
                .padding(.bottom, Constants.nextButtonHeight + geometry.safeAreaInsets.bottom)
                
                // MARK: - Bottom Button
                Button(action: {
                    self.isLinkActive = true
                }) {
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
            }
            .edgesIgnoringSafeArea(.bottom)
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
