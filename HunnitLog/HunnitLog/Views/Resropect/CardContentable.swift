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
            
            //막대기
            ZStack {
                ZStack(alignment: .leading) {
                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(height: 18)
                        .cornerRadius(4)
                    Rectangle()
                        .foregroundColor(.yellow)
                        .frame(width: 60, height: 18)
                        .cornerRadius(4)
                    
                }
                Text("\(String(format: "%.2f", achievementRate))%")
                    .font(.system(size: 13))
                    .fontWeight(.semibold)
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

