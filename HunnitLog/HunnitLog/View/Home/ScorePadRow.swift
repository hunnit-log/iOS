//
//  ScorePadRow.swift
//  HunnitLog
//
//  Created by 초이 on 2020/12/06.
//

import SwiftUI

struct ScorePadRow: View {
    let title: String
    let achievement: Int
    
    private enum Constants {
        static let titleHorizontalPadding: CGFloat = 7
        static let padHorizontalPadding: CGFloat = 11
        static let padVerticalPadding: CGFloat = 17
        static let topPadding: CGFloat = 15
        static let bottomPadding: CGFloat = 11
        static let trailing: CGFloat = 17
        static let circleDiameter: CGFloat = 47
        static let titleFont: Font = .system(size: 17)
        static let achievementFont: Font = .system(size: 13)
        static let borderWidth: CGFloat = 0.3
        static let borderRadius: CGFloat = 13
        
        static let upImageName: String = "chevron.up"
    }
    
    // MARK: - 더미 데이터 구조체
    struct FeelingIcon: Hashable {
        var feeling: Feeling
    }
    
    // MARK: - 더미 데이터
    // 왜 여기선 private 선언하면 오류가 나는가,,
    var goalFeeling = FeelingIcon(feeling: Feeling.excellent)

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                goalFeeling.feeling.icon
                    .resizable()
                    .frame(width: Constants.circleDiameter, height: Constants.circleDiameter)
                    .padding(.trailing, Constants.trailing)
                VStack(alignment: .leading) {
                    HStack {
                        Text(title)
                            .font(Constants.titleFont)
                    }
                    HStack {
                        Text("달성률 \(achievement)%")
                            .font(Constants.achievementFont)
                            .foregroundColor(CustomColor.coolGray)
                    }
                }
                Spacer()
                Image(systemName: Constants.upImageName)
                    .foregroundColor(CustomColor.darkGray)
                
            }
            .padding(.horizontal, Constants.titleHorizontalPadding)
            ScorePad()
                .padding(.top, Constants.padVerticalPadding)
        }
        .padding(.horizontal, Constants.padHorizontalPadding)
        .padding(.top, Constants.topPadding)
        .padding(.bottom, Constants.bottomPadding)
        .background(Color.white)
        .makeRoundedWithBorder(CustomColor.gray, width:Constants.borderWidth, cornerRadius: Constants.borderRadius)
    }
}

struct ScorePadRow_Previews: PreviewProvider {
    static var previews: some View {
        ScorePadRow(title: "목표제목입니다목표제목입니다목표제목입니다목표제목입니다목표제목입니다", achievement: 20)
    }
}
