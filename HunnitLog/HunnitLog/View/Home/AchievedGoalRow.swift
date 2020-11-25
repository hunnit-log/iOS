//
//  AchievedGoalRow.swift
//  HunnitLog
//
//  Created by 초이 on 2020/11/26.
//

import SwiftUI

struct AchievedGoalRow: View {
    let title: String
    let achievement: Int
    
    var body: some View {
        HStack(spacing: 7) {
            ZStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: 47, height: 47)
                Text("👍")
                    .font(.system(size: 22))
            }
            .padding(.trailing, 10)
            VStack {
                HStack {
                    Text(title)
                        .font(.system(size: 17))
                        Spacer()
                }
                HStack {
                    Text("달성률 \(achievement)%")
                        .font(.system(size: 13))
                        .foregroundColor(CustomColor.coolGray)
                    Spacer()
                }
            }
            Image(systemName: "chevron.down")
                .foregroundColor(CustomColor.darkGray)
        }
        .padding(.horizontal, 18)
        .padding(.vertical, 15)
        .background(CustomColor.yellow)
        .makeRoundedWithBorder(CustomColor.gray, width:0.3, cornerRadius: 13)
    }
}

struct AchievedGoalRow_Previews: PreviewProvider {
    static var previews: some View {
        AchievedGoalRow(title: "목표제목입니다목표제목입니다목표제목입니다목표제목입니다목표제목입니다", achievement: 100)
    }
}
