//
//  QuestionAnswerView.swift
//  HunnitLog
//
//  Created by Kang, Su Jin (강수진) on 2020/12/07.
//

import SwiftUI
import Combine

//TODO: - Navigation 연결
struct QuestionAnswerView: View {
    
    // MARK: - 더미데이터
    let period: String = "2020. 11. 01 - 2020. 1. 29"
    let title: String = "다섯번째 회고록"
    let contents: [DetailAnswer] =  [
        DetailAnswer(question: "무엇이 가장 만족스러운가요?", answer: "사과는 연평균 기온이 8~11℃의 비교적 서늘한 기후에 적당한 온대북부과수이다. 우리나라는 사과재배에 기온이 알맞고 사과나무 재배가 가능한 유효경사지가 많기 때문에 전체 과수 재배면적의 약 40%를 차지하고 있다. 우리나라의 주산지도 기상상태가 특이한 대구지방을 제외하고는 연평균 기온이 8~12℃ 전후인 예산, 충주와 북부지방인 사리원, 환주, 남포였었다. 그리고 사과는 연평균 기온이 8~11℃의 비교적 서늘한 기후에 적당한 온대북부과수이다. 우리나라는 사과재배에 기온이 알맞고 사과나무 재배가 가능한 유효경사지가 많기 때문에 전체 과수 재배면적의 약 40%를 차지하고 있다. 우리나라의 주산지도 기상상태가 특이한 대구지방을 제외하고는 연평균 기온이 8~12℃ 전후인 예산, 충주와 북부지방인 사리원, 환주, 남포였었다.사과는 연평균 기온이 8~11℃의 비교적 서늘한 기후에 적당한 온대북부과수이다. 우리나라는 사과재배에 기온이 알맞고 사과나무 재배가 가능한 유효경사지가 많기 때문에 전체 과수 재배면적의 약 40%를 차지하고 있다. 우리나라의 주산지도 기상상태가 특이한 대구지방을 제외하고는 연평균 기온이 8~12℃ 전후인 예산, 충주와 북부지방인 사리원, 환주, 남포였었다."),
        DetailAnswer(question: "Q. 아쉬운 점은 없었나요?", answer: "사과는 연평균 기온이 8~11℃의 비교적 서늘한 기후에 적당한 온대북부과수이다. 우리나라는 사과재배에 기온이 알맞고 사과나무 재배가 가"),
        DetailAnswer(question: "Q. 무엇을 개선해야 할까요?", answer: "사과는 연평균 기온이 8~11℃의 비교적 서늘한 기후에 적당한 온대북부과수이다. 우리나라는 사과재배에 기온이 알맞고 사과나무 재배가 가능한 유효경사지가 많기 때문에 전체 과수 재배면적의 약 40%를 차지하고 있다. 우리나라의 주산지도 기상상태가 특이한 대구지방을 제외하고는 연평균 기온이 8~12℃ 전후인 예산, 충주와 북부지방인 사리원, 환주, 남포였었다. 그리고 사과는 연평균 기온이 8~11℃의 비교적 서늘한 기후에 적당한 온대북부과수이다. 우리나라는 사과재배에 기온이 알맞고 사과나무 재배가 가능한 유효경사지가 많기 때문에 전체 과수 재배면적의 약 40%를 차지하고 있다."),
        DetailAnswer(question: "Q. 가장 힘든 점이 무엇이었나요?"),
        DetailAnswer(question: "Q. 왜 어려웠나요?"),
    ]
    //TODO: - 색상 변경 트리거 조건 파악 후 연결
    @State var isNextActive = false
    
    private enum Constants {
        static let descriptionFont: Font = .system(size: 14)
        static let descriptionText =
            Text("당신을 돌아보며 ").font(Constants.descriptionFont)
            + Text("회고를 작성").font(Constants.descriptionFont).bold()
            + Text("해보세요.").font(Constants.descriptionFont)
        
        static let rowMaxHeight: CGFloat = 240
        static let rowVerticalPadding: CGFloat = 10
        static let rowCornerRadius: CGFloat = 27
        
        static let listBottomPadding: CGFloat = 5
    }
    
    var body: some View {
        ZStack {
            CustomColor.bgColor
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    //MARK: - 상단 헤더 뷰
                    RetrospectWriteHeaderView(period: period,
                                              title: title,
                                              descriptionText: Constants.descriptionText)
                    //MARK: - ScrollView
                    ScrollView(showsIndicators: false) {
                        LazyVStack(spacing: 0) {
                            ForEach(contents) { (content) in
                                DetailAnswerRow(question: content.question,
                                                answer: content.answer,
                                                isEditable: true,
                                                isFromDetailView: false)
                                    .frame(maxHeight: Constants.rowMaxHeight)
                                    .modifier(ShadowCard()) //TODO: -  ShadowCard radius 추가
                            }
                            .padding(.vertical, Constants.rowVerticalPadding)
                        }
                        .padding(.bottom, Constants.listBottomPadding)
                    }
                    //MARK: - 하단 다음 버튼
                    BottomNextButton(geometry: geometry,
                                     isActive: $isNextActive,
                                     type: .next,
                                     buttonAction: {
                                        //임의로 버튼 색상 변경
                                        isNextActive.toggle()
                                     })
                }.edgesIgnoringSafeArea(.bottom)
            }
        }
    }
}

struct QuestionAnswerView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionAnswerView()
    }
}
