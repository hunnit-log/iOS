//
//  RetrospectWriteHeaderView.swift
//  HunnitLog
//
//  Created by Kang, Su Jin (강수진) on 2020/12/08.
//

import SwiftUI

struct RetrospectWriteHeaderView: View {
    //TODO: - SelectAchievementView 헤더 쪽 리팩토링
    let period: String
    let title: String
    let descriptionText: Text
    
    private enum Constants {
        static let periodFont: Font = .system(size: 17, weight: .medium)
        static let periodTop: CGFloat = 10
        static let periodBottom: CGFloat = 6
        static let periodLeading: CGFloat = 33
        
        static let titleFont: Font = .system(size: 25, weight: .bold)
        static let titleBottom: CGFloat = 21
        
        static let iconName: String = "imgGraphicQuestionTwo"
        static let iconWidth: CGFloat = 103
        static let iconHeight: CGFloat = 86
        static let iconTrailing: CGFloat = 19
        
        static let descriptionTop: CGFloat = 9
        static let descriptionBottom: CGFloat = 17 //todo 성취율 선택에선 27로 되어있음
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    //MARK: - 날짜
                    Text(period)
                        .font(Constants.periodFont)
                        .foregroundColor(CustomColor.black)
                        .padding(.top, Constants.periodTop)
                        .padding(.bottom, Constants.periodBottom)
                    
                    //MARK: - 횟수
                    Text(title)
                        .font(Constants.titleFont)
                        .foregroundColor(CustomColor.black)
                        .padding(.bottom, Constants.titleBottom)
                }
                
                Spacer()
                
                //MARK: - 아이콘
                Image(Constants.iconName)
                    .resizable()
                    .frame(width: Constants.iconWidth,
                           height: Constants.iconHeight)
                    .padding(.trailing, Constants.iconTrailing)
            }.padding(.leading, Constants.periodLeading)
            
            HStack {
                //MARK: - 설명
                descriptionText
                    .foregroundColor(CustomColor.black)
                    .padding(.leading, Constants.periodLeading)
                    .padding(.top, Constants.descriptionTop)
                    .padding(.bottom, Constants.descriptionBottom)
                Spacer()
            }
        }
    }
}


struct RetrospectWriteHeaderView_Previews: PreviewProvider {
 
    static var previews: some View {
        RetrospectWriteHeaderView(period: "2020. 11. 01 - 2020. 1. 29",
                                  title: "다섯번째 회고록",
                                  descriptionText: Text("당신을 돌아보며 ")
                                    + Text("회고를 작성").bold()
                                    + Text("해보세요."))
    }
}
