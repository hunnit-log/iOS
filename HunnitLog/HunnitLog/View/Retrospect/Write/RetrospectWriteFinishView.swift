//
//  RetrospectWriteFinishView.swift
//  HunnitLog
//
//  Created by Kang, Su Jin (강수진) on 2020/12/05.
//

import SwiftUI

struct RetrospectWriteFinishView: View {
    //TODO: - Navigation 연결 및 상단 작업
    // MARK: - 더미데이터
    let period = "2020. 11. 01 - 2020. 1. 29"
    let title = "다섯번째 회고록"
    @State var isActive = true
    
    let evaluation: String = "조금 부족해요."
    let achievement: Double = 25
    let feeling: Feeling = .notBad
    
    @State var isAlertPresented: Bool = false
    
    private enum Constants {
        static let periodFont: Font = .system(size: 17, weight: .medium)
        static let periodTop: CGFloat = 6
        static let periodBottom: CGFloat = 6
        
        static let titleFont: Font = .system(size: 25, weight: .bold)
        static let titleBottom: CGFloat = 21
        
        static let finishDescription = "회고록을 모두 작성했어요!"
        static let finishDescriptionFont: Font = .system(size: 14)
        static let finishDescriptionBottom: CGFloat = 65
        
        static var feelingWidth: CGFloat = 75
        static var feelingHeight: CGFloat = 75
        static var feelingBottom: CGFloat = 15
        
        static let evaluationTitle = "평균 점수는"
        static let evaluationTitleFont: Font = .system(size: 15)
        static let evaluationTitleBottom: CGFloat = 1
        
        static let evaluationFont: Font = .system(size: 19, weight: .bold)
        static let evaluationBottom: CGFloat = 30
        
        static let achievementTitle = "목표 평균 달성률은"
        static let achievementTitleFont: Font = .system(size: 15)
        static let achievementTitleBottom: CGFloat = 10
        
        static let achievementBarHeight: CGFloat = 18
        static let achievementBarWidth: CGFloat = 232 / 375 * UIScreen.main.bounds.width
        
        static let achievementFont: Font = .system(size: 19, weight: .bold)
        
        static let achievementPostfix = "에요"
        static let achievementPostfixFont: Font = .system(size: 16, weight: .medium)
        
        static let summaryTop: CGFloat = 49
        static let summaryBottom: CGFloat = 34
        static let summaryHorizontalPadding: CGFloat = 33
        
        static let alertTitle = "정말 등록하시겠습니까?"
        static let alertMessage = "한 번 작성한 회고록은 수정할 수 없어요."
        static let alertOk = "등록"
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                Text(period)
                    .font(Constants.periodFont)
                    .foregroundColor(CustomColor.black)
                    .padding(.top, Constants.periodTop)
                    .padding(.bottom, Constants.periodBottom)
                
                Text(title)
                    .font(Constants.titleFont)
                    .foregroundColor(CustomColor.black)
                    .padding(.bottom, Constants.titleBottom)
                
                Text(Constants.finishDescription)
                    .font(Constants.finishDescriptionFont)
                    .foregroundColor(CustomColor.black)
                    .padding(.bottom, Constants.finishDescriptionBottom)
                
                VStack {
                    feeling.icon
                        .resizable()
                        .frame(width: Constants.feelingWidth,
                               height: Constants.feelingHeight)
                        .padding(.bottom, Constants.feelingBottom)
                    
                    VStack {
                        Text(Constants.evaluationTitle)
                            .font(Constants.evaluationTitleFont)
                            .foregroundColor(CustomColor.black)
                            .padding(.bottom, Constants.evaluationTitleBottom)
                        Text(evaluation)
                            .font(Constants.evaluationFont)
                            .foregroundColor(CustomColor.black)
                            .padding(.bottom, Constants.evaluationBottom)
                        Text(Constants.achievementTitle)
                            .font(Constants.achievementTitleFont)
                            .foregroundColor(CustomColor.black)
                            .padding(.bottom, Constants.achievementTitleBottom)
                        
                        AchievementBar(width: Constants.achievementBarWidth,
                                       height: Constants.achievementBarHeight,
                                       achievement: achievement)
                        HStack {
                            Text("\(String(format: "%.1f", achievement))%")
                                .font(Constants.achievementFont)
                                .foregroundColor(CustomColor.black)
                            Text(Constants.achievementPostfix)
                                .font(Constants.achievementPostfixFont)
                                .foregroundColor(CustomColor.black)
                        }
                    }
                }
                .padding(.top, Constants.summaryTop)
                .padding(.bottom, Constants.summaryBottom)
                .padding(.horizontal, Constants.summaryHorizontalPadding)
                .modifier(HunnitSummary())
                
                Spacer()
                BottomNextButton(geometry: geometry,
                                 isActive: $isActive,
                                 type: .next,
                                 buttonAction: {
                                    isAlertPresented = true
                                 }).customAlert(isPresented: $isAlertPresented) {
                                    CustomAlert(title: Text(Constants.alertTitle),
                                                message: Text(Constants.alertMessage),
                                                primaryButton: .cancel(),
                                                secondaryButton: .default(Text(Constants.alertOk), action: {
                                                    print("등록!")
                                                }))
                                 }
            }.edgesIgnoringSafeArea(.bottom)
        }
    }
}



struct RetrospectWriteFinishView_Previews: PreviewProvider {
    static var previews: some View {
        RetrospectWriteFinishView()
        RetrospectWriteFinishView()
            .previewDevice("iPhone 12 Pro")
    }
}
