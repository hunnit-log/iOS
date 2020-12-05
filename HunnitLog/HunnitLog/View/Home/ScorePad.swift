//
//  ScorePad.swift
//  HunnitLog
//
//  Created by 초이 on 2020/12/06.
//

import SwiftUI

struct ScorePad: View {
    
    private enum Constants {
        static let titleFont: Font = .system(size: 16)
        static let numberFont: Font = .system(size: 13)
        static let backgroundRadius: CGFloat = 13
        
        static let feelingsDiameter: CGFloat = 32
        static let feelingSpacing: CGFloat = 5
        
        static let padHeight: CGFloat = 236
        
        static let leftImageName: String = "icCalendarBack"
        static let rightImageName: String = "icCalendarNext"
    }
    
    // MARK: - 서버 구현 방식에 따라 달라질 내용들
    let date = Date()
    let calendar = Calendar(identifier: .gregorian)
    let currentYear = Calendar.current.component(.year, from: Date())
    let currentMonth = Calendar.current.component(.month, from: Date())
    @State private var showingMonth = Calendar.current.component(.month, from: Date())
    @State private var dateComponents = DateComponents()
    
    // MARK: - Grid 형태 정의
    var columns: [GridItem] {
        [
            GridItem(.fixed(Constants.feelingsDiameter), spacing:Constants.feelingSpacing),
            GridItem(.fixed(Constants.feelingsDiameter), spacing:Constants.feelingSpacing),
            GridItem(.fixed(Constants.feelingsDiameter), spacing:Constants.feelingSpacing),
            GridItem(.fixed(Constants.feelingsDiameter), spacing:Constants.feelingSpacing),
            GridItem(.fixed(Constants.feelingsDiameter), spacing:Constants.feelingSpacing),
            GridItem(.fixed(Constants.feelingsDiameter), spacing:Constants.feelingSpacing),
            GridItem(.fixed(Constants.feelingsDiameter), spacing:Constants.feelingSpacing)
        ]
    }
    
    // MARK: - fake action functions: 월 숫자 보정
    func goPrev() {
        self.showingMonth = showingMonth == 1 ? 12 : (showingMonth - 1) % 12
        self.dateComponents.month = showingMonth
    }
    func goNext() {
        self.showingMonth = showingMonth == 11 ? 12 : (showingMonth + 1) % 12
        self.dateComponents.month = showingMonth
    }
    
    // MARK: - 더미 데이터 구조체
    struct dailyFeeling: Hashable {
        var day: Int
        var feeling: Feeling
    }
    
    // MARK: - 더미 데이터
    private var feelings = [
        dailyFeeling(day: 1, feeling: Feeling.good),
        dailyFeeling(day: 2, feeling: Feeling.notBad),
        dailyFeeling(day: 3, feeling: Feeling.excellent),
        dailyFeeling(day: 4, feeling: Feeling.bad),
        dailyFeeling(day: 5, feeling: Feeling.soso)
    ]
    
    var body: some View {
        let range = calendar.range(of: .day, in: .month, for: calendar.date(from:dateComponents)!)
        let numDays = range!.count
        
        ZStack {
            Rectangle()
                .cornerRadius(Constants.backgroundRadius)
                .foregroundColor(CustomColor.bgColor)
            VStack {
                HStack {
                    Button(action: goPrev, label: {
                        // TODO: - 아이콘 색 분기처리
                        Image(Constants.leftImageName)
                            .foregroundColor(CustomColor.black)
                    })
                    Spacer()
                    Text("\(String(currentYear))년 \(showingMonth)월")
                        .font(Constants.titleFont)
                    Spacer()
                    Button(action: goNext, label: {
                        Image(Constants.rightImageName)
                            .foregroundColor(CustomColor.black)
                    })
                    
                }
                LazyVGrid(columns: columns, spacing:5, content: {
                    ForEach(0..<numDays) { f in
                        if f < feelings.count {
                            feelings[f].feeling.icon
                                .resizable()
                                .frame(width:Constants.feelingsDiameter, height:Constants.feelingsDiameter)
                        } else {
                            ZStack {
                                Circle()
                                    .frame(width:Constants.feelingsDiameter, height:Constants.feelingsDiameter)
                                    .foregroundColor(CustomColor.lightGray)
                                Text("\(f + 1)")
                                    .font(Constants.numberFont)
                                    .foregroundColor(CustomColor.coolGray)
                            }
                        }
                    }
                })
                .lineSpacing(Constants.feelingSpacing)
            }
        }
        .frame(height: Constants.padHeight)
    }
}

struct ScorePad_Previews: PreviewProvider {
    static var previews: some View {
        ScorePad()
    }
}
