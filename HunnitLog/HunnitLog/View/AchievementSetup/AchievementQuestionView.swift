//
//  AchievementQuestionView.swift
//  HunnitLog
//
//  Created by seungwook.jung on 2020/12/05.
//

import SwiftUI

struct AchievementQuestionView: View {
    private enum Constants {
        static let contentWidth: CGFloat = 309
        static let cornerRadius: CGFloat = 9
        static let borderWidth: CGFloat = 0.5
        
        static let titleString: String = "회고하면서 물어볼\n질문들을 정해봅시다."
        static let titleFont: Font = .system(size: 27, weight: .semibold)
        static let titleLetterSpacing: CGFloat = -0.81
        
        static let descriptionString: String = "회고는 3~6개 항목이 좋아요.\n당신을 돌아볼 수 있는 질문을 골라보세요."
        static let descriptionFont: Font = .system(size: 14, weight: .regular)
        static let descriptionLetterSpacing: CGFloat = -0.42
        
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Text(Constants.titleString)
                    .font(Constants.titleFont)
                    .kerning(Constants.titleLetterSpacing)
                    .foregroundColor(CustomColor.black)
                    .frame(width: Constants.contentWidth, alignment: .leading)
                    .padding(.bottom, 28)
                
                Text(Constants.descriptionString)
                    .font(Constants.descriptionFont)
                    .kerning(Constants.descriptionLetterSpacing)
                    .foregroundColor(CustomColor.coolGray)
                    .frame(width: Constants.contentWidth, alignment: .leading)
                    .padding(.bottom, 57)
                
                RetrospectQuestionView()
                    .padding(.bottom, 28)
                
            }
        }
    }
}

struct AchievementQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementQuestionView()
    }
}
