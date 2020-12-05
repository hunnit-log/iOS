//
//  CardContentable.swift
//  HunnitLog
//
//  Created by Kang, Su Jin (강수진) on 2020/11/19.
//

import SwiftUI

protocol CardContentable: View {}

//MARK: - UnwrittenContent
struct UnwrittenContent: CardContentable {
    let defaultMessage = "회고를 작성하지 않았습니다."
    var body: some View {
        Text(defaultMessage)
            .font(.system(size: 15))
            .fontWeight(.regular)
            .foregroundColor(.gray)
    }
}

//MARK: - WrittenContent
struct WrittenContent: CardContentable {
    let period: String
    let title: String
    let achievementRate: Double
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 0) {
                    Text(period)
                        .font(.system(size: 13))
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                        .padding(.bottom, 2)
                    Text(title)
                        .font(.system(size: 18))
                        .frame(height: 28)
                        .padding(.bottom, 8)
                    Text("달성률")
                        .font(.system(size: 12))
                        .fontWeight(.medium)
                        .foregroundColor(.gray)
                        .padding(.bottom, 4)
                    
                }
                Spacer()
                Circle()
                    .frame(width: 47, height: 47)
                    .foregroundColor(Color(red: 201/255, green: 242/255, blue: 166/255, opacity: 1))
                    .padding(.top, 5)
            }
            
            ZStack {
                GeometryReader(content: { geometry in
                    //막대기
                    AchievementBar(width: geometry.size.width,
                                   height: 18,
                                   achievement: 25)
                    Text("\(String(format: "%.2f", achievementRate))%")
                        .font(.system(size: 13))
                        .fontWeight(.semibold)
                        .frame(width: geometry.size.width,
                               height: 18)
                })
            }
        }
        .padding(.vertical, 19)
        .padding(.horizontal, 14)
    }
}

//MARK: - ToBeWrittenContent
struct ToBeWrittenContent: CardContentable {
    var body: some View {
        Image(systemName: "plus")
            .font(.largeTitle)
    }
}

//MARK: - AchievementContent
struct AchievementContent: CardContentable {
    let period: String
    let achievementRate: Double
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(period)
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                Text("총 \(String(format: "%.2f", achievementRate))% 달성")
                    .font(.system(size: 16))
                    .fontWeight(.regular)
                    .foregroundColor(.gray)
            }
            Spacer()
            Image(systemName: "chevron.right")
                .frame(width: 24, height: 24)
        }
        .padding(.top, 16)
        .padding(.bottom, 14)
        .padding(.leading, 20)
        .padding(.trailing, 11)
    }
}

struct CardContentable_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ToBeWrittenContent()
            WrittenContent(period: "2020.10.21 - 2020.11.02",
                                    title: "다섯번째 회고록",
                                    achievementRate: 25)
            UnwrittenContent()
            AchievementContent(period: "2020. 11. 01 - 2020. 1. 29",
                                                       achievementRate: 89)
        }
    }
}
