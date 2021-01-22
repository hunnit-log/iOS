//
//  SelectAchievementView.swift
//  HunnitLog
//
//  Created by Kang, Su Jin (강수진) on 2020/12/06.
//

import SwiftUI

struct SelectAchievementView: View {
    // MARK: - 더미데이터
    let period = "2020. 11. 01 - 2020. 1. 29"
    let title = "다섯번째 회고록"
    
    //TODO: - 색상 변경 트리거 조건 파악 후 연결
    @State var isNextActive = false
    
    var achievements = [Achievement(title: "올해 안에 연애하기", percentage: 65),
                        Achievement(title: "운전면허를 따고 제주도가서 혼자 배낭여행 하기", percentage: 65),
                        Achievement(title: "몸무게 10kg 줄이기", percentage: 35),
                        Achievement(title: "토익 900점 찍기", percentage: 100),
                        Achievement(title: "올해 안에 연애하기, 올해 안에 연애하기", percentage: 100),
                        Achievement(title: "올해 안에 연애하기", percentage: 65),
                        Achievement(title: "운전면허를 따고 제주도가서 혼자 배낭여행 하기", percentage: 65),
                        Achievement(title: "몸무게 10kg 줄이기", percentage: 35),
                        Achievement(title: "토익 900점 찍기", percentage: 100),
                        Achievement(title: "올해 안에 연애하기", percentage: 100),
    ]
    
    private enum Constants {
        static let periodFont: Font = .system(size: 17, weight: .medium)
        static let periodTop: CGFloat = 10
        static let periodBottom: CGFloat = 6
        static let periodLeading: CGFloat = 33
        
        static let titleFont: Font = .system(size: 25, weight: .bold)
        static let titleBottom: CGFloat = 21
        
        static let iconName: String = "imgGraphicQuestionOne"
        static let iconWidth: CGFloat = 103
        static let iconHeight: CGFloat = 86
        static let iconTrailing: CGFloat = 19
        
        static let selectDescriptionFont: Font = .system(size: 14)
        static let selectDescriptionText =
            Text("+, - 를 눌러 ").font(selectDescriptionFont)
            + Text("목표별 현재 달성률을 기록").font(selectDescriptionFont).bold()
            + Text("해주세요.").font(selectDescriptionFont)
        
        static let selectDescriptionTop: CGFloat = 9
        static let selectDescriptionBottom: CGFloat = 27
        
        static let rowHorizontalPadding: CGFloat = 33
        static let firstRowTop: CGFloat = 10
        static let listTop: CGFloat = 5
        static let listCornerRadius: CGFloat = 27
        static let listBottomPadding: CGFloat = 25
    }
    
    var body: some View {
        ZStack {
            CustomColor.bgColor
            GeometryReader { geometry in
                VStack(alignment: .leading, spacing: 0) {
                    //MARK: - 상단 회고록 정보 (날짜, 횟수, 이미지 등)
                    HStack {
                        VStack(alignment: .leading, spacing: 0) {
                            Text(period)
                                .font(Constants.periodFont)
                                .foregroundColor(CustomColor.black)
                                .padding(.top, Constants.periodTop)
                                .padding(.bottom, Constants.periodBottom)
                            
                            Text(title)
                                .font(Constants.titleFont)
                                .foregroundColor(CustomColor.black)
                                .padding(.bottom, Constants.titleBottom)
                        }
                        
                        Spacer()
                        
                        Image(Constants.iconName)
                            .resizable()
                            .frame(width: Constants.iconWidth,
                                   height: Constants.iconHeight)
                            .padding(.trailing, Constants.iconTrailing)
                    }.padding(.leading, Constants.periodLeading)
                    
                    HStack {
                        Constants.selectDescriptionText
                            .foregroundColor(CustomColor.black)
                            .padding(.leading, Constants.periodLeading)
                            .padding(.top, Constants.selectDescriptionTop)
                            .padding(.bottom, Constants.selectDescriptionBottom)
                        Spacer()
                    }
                    
                    //MARK: - ScrollView
                    ScrollView(showsIndicators: false) {
                        LazyVStack(spacing: 0) {
                            ForEach(achievements) { (achievement) in
                                SelectAchievementRow(title: achievement.title,
                                                     percentage: Double(achievement.percentage))
                                    .padding(.horizontal, Constants.rowHorizontalPadding)
                            }
                        }
                        .padding(.top, Constants.firstRowTop)
                        .padding(.bottom, Constants.listBottomPadding)
                        .modifier(ShadowCard(cornerRadius: Constants.listCornerRadius))
                        .padding(.top, Constants.listTop) //for shadow
                        .padding(.bottom, -Constants.listBottomPadding) //for hide corner radius
                    }
                    
                    //MARK: - 하단 다음 버튼
                    
                    BottomNextButton(geometry: geometry,
                                     isActive: $isNextActive,
                                     type: .next,
                                     buttonAction: {})
                }.edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}

struct SelectAchievementView_Previews: PreviewProvider {
    static var previews: some View {
        SelectAchievementView()
    }
}
