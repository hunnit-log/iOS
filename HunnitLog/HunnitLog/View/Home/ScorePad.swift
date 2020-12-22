//
//  ScorePad.swift
//  HunnitLog
//
//  Created by 초이 on 2020/12/06.
//

import SwiftUI

struct ScorePad: View {
    
    private enum Constants {
        static let titleFont: Font = .system(size: 16, weight: .medium)
        static let numberFont: Font = .system(size: 13)
        static let backgroundRadius: CGFloat = 13
        
        static let feelingsDiameter: CGFloat = 32
        static let feelingSpacing: CGFloat = 5
        
        static let padHeight: CGFloat = 236
        static let padBottomPadding: CGFloat = 7
        
        static let leftImageName: String = "icCalendarBack"
        static let rightImageName: String = "icCalendarNext"
        
        static let titleTopPadding: CGFloat = 16
        static let titleHorizontalPadding: CGFloat = 16
        static let titleBottomPadding: CGFloat = 14
    }
    
    // MARK: - 서버 구현 방식에 따라 달라질 내용들
    let date = Date()
    let calendar = Calendar(identifier: .gregorian)
    let currentYear = Calendar.current.component(.year, from: Date())
    let currentMonth = Calendar.current.component(.month, from: Date())
    @State private var showingMonth = Calendar.current.component(.month, from: Date())
    @State private var dateComponents = DateComponents()
    
    // MARK: - Gr87id 형태 정의
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
    struct DailyFeeling: Hashable {
        var day: Int
        var feeling: Feeling
    }
    
    // MARK: - 더미 데이터
    private var feelings = [
        DailyFeeling(day: 1, feeling: Feeling.good),
        DailyFeeling(day: 20, feeling: Feeling.notBad),
        DailyFeeling(day: 13, feeling: Feeling.excellent),
        DailyFeeling(day: 24, feeling: Feeling.bad),
        DailyFeeling(day: 5, feeling: Feeling.soso)
    ]
    
    var body: some View {
        let range = calendar.range(of: .day, in: .month, for: calendar.date(from:dateComponents) ?? Date())
        let numDays = range?.count ?? 0
        
        ZStack {
            Rectangle()
                .cornerRadius(Constants.backgroundRadius)
                .foregroundColor(CustomColor.bgColor)
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Button(action: goPrev, label: {
                        // TODO: - 아이콘 색 분기처리
                        Image(Constants.leftImageName)
                            .foregroundColor(CustomColor.black)
                    })
                    Spacer()
                    Text("\(String(currentYear))년 \(showingMonth)월")
                        .font(Constants.titleFont)
                        .foregroundColor(CustomColor.black)
                    Spacer()
                    Button(action: goNext, label: {
                        Image(Constants.rightImageName)
                            .foregroundColor(CustomColor.black)
                    })
                }
                .padding(.top, Constants.titleTopPadding)
                .padding(.horizontal, Constants.titleHorizontalPadding)
                .padding(.bottom, Constants.titleBottomPadding)
                
                
                var feelingSort = feelings.sorted(by: {$0.day < $1.day})
                LazyVGrid(columns: columns, spacing:5, content: {
                    ForEach(1...numDays, id:\.self) { day in
                        if (feelingSort.first?.day == day) {
                            feelingSort.removeFirst().feeling.icon
                                .resizable()
                                .frame(width:Constants.feelingsDiameter, height:Constants.feelingsDiameter)
                        } else {
                            ZStack {
                                Circle()
                                    .frame(width:Constants.feelingsDiameter, height:Constants.feelingsDiameter)
                                    .foregroundColor(CustomColor.lightGray)
                                Text("\(day)")
                                    .font(Constants.numberFont)
                                    .foregroundColor(CustomColor.coolGray)
                            }
                        }
                    }
                })
                .lineSpacing(Constants.feelingSpacing)
                Spacer()
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
