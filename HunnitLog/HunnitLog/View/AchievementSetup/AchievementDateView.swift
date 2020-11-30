//
//  AchievementDateView.swift
//  HunnitLog
//
//  Created by seungwook.jung on 2020/11/30.
//

import SwiftUI

struct AchievementDateView: View {
    private enum Constants {
        static let contentWidth: CGFloat = 309
        static let cornerRadius: CGFloat = 9
        static let borderWidth: CGFloat = 0.5
        
        static let titleString: String = "100일간의 도전,\n언제부터 시작할까요? 🤩"
        static let titleFont: Font = .system(size: 27, weight: .semibold)
        static let titleLetterSpacing: CGFloat = -0.81
        
        static let descriptionString: String = "허닛과 함께 100일간\n당신의 목표를 향해 달려가요."
        static let descriptionFont: Font = .system(size: 14, weight: .regular)
        static let descriptionLetterSpacing: CGFloat = -0.42
        
        static let buttonTextFont: Font = .system(size: 19, weight: .regular)
        static let buttonHeight: CGFloat = 57
        
        static let footerFont: Font = .system(size: 16, weight: .regular)
        static let footerLetterSpacing: CGFloat = -0.48
    }
    
    private let buttonAction: () -> Void = {
        
    }
    
    var buttonTitleString: String = "2020년 11월 5일"
    var footerString: String = "종료일 : 2021년 5월 4일"
    
    var body: some View {
        VStack {
            Text(Constants.titleString)
                .font(Constants.titleFont)
                .kerning(Constants.titleLetterSpacing)
                .foregroundColor(CustomColor.black)
                .frame(width: Constants.contentWidth, alignment: .leading)
            
            Spacer()
                .frame(width: .infinity, height: 28)
            
            Text(Constants.descriptionString)
                .font(Constants.descriptionFont)
                .kerning(Constants.descriptionLetterSpacing)
                .foregroundColor(CustomColor.coolGray)
                .frame(width: Constants.contentWidth, alignment: .leading)
            
            Spacer()
            Spacer()
            
            Button(action: self.buttonAction) {
                Text(self.buttonTitleString)
                    .font(Constants.buttonTextFont)
                    .foregroundColor(CustomColor.black)
            }
            .frame(width: Constants.contentWidth, height: Constants.buttonHeight, alignment: .center)
            .overlay(RoundedRectangle(cornerRadius: Constants.cornerRadius)
                        .stroke(CustomColor.gray,
                                lineWidth: Constants.borderWidth))
            
            Spacer()
            Spacer()
            Spacer()
            
            Text(self.footerString)
                .font(Constants.footerFont)
                .kerning(Constants.footerLetterSpacing)
                .foregroundColor(CustomColor.coolGray)
                .frame(width: Constants.contentWidth, alignment: .center)
                .padding(.bottom, 27)
        }
    }
}

struct AchievementDateView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementDateView()
    }
}
