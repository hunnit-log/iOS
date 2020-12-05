//
//  RetrospectDetailView.swift
//  HunnitLog
//
//  Created by Kang, Su Jin (강수진) on 2020/12/04.
//

import SwiftUI

struct RetrospectDetailView: View {
    // MARK: - 더미데이터
    let period: String = "2020. 11. 01 - 2020. 1. 29"
    let averageEvaluation = "조금 부족해요"
    let averageAchievement = 89
    let navigationBarTitle = "다섯번째 회고록"
    
    var questions = [
        DetailAnswer(question: "무엇이 가장 만족스러운가요?", answer: "사과는 연평균 기온이 8~11℃의 비교적 서늘한 기후에 적당한 온대북부과수이다. 우리나라는 사과재배에 기온이 알맞고 사과나무 재배가 가능한 유효경사지가 많기 때문에 전체 과수 재배면적의 약 40%를 차지하고 있다. 우리나라의 주산지도 기상상태가 특이한 대구지방을 제외하고는 연평균 기온이 8~12℃ 전후인 예산, 충주와 북부지방인 사리원, 환주, 남포였었다. 그리고 사과는 연평균 기온이 8~11℃의 비교적 서늘한 기후에 적당한 온대북부과수이다. 우리나라는 사과재배에 기온이 알맞고 사과나무 재배가 가능한 유효경사지가 많기 때문에 전체 과수 재배면적의 약 40%를 차지하고 있다. 우리나라의 주산지도 기상상태가 특이한 대구지방을 제외하고는 연평균 기온이 8~12℃ 전후인 예산, 충주와 북부지방인 사리원, 환주, 남포였었다.사과는 연평균 기온이 8~11℃의 비교적 서늘한 기후에 적당한 온대북부과수이다. 우리나라는 사과재배에 기온이 알맞고 사과나무 재배가 가능한 유효경사지가 많기 때문에 전체 과수 재배면적의 약 40%를 차지하고 있다. 우리나라의 주산지도 기상상태가 특이한 대구지방을 제외하고는 연평균 기온이 8~12℃ 전후인 예산, 충주와 북부지방인 사리원, 환주, 남포였었다."),
        DetailAnswer(question: "Q. 아쉬운 점은 없었나요?", answer: "사과는 연평균 기온이 8~11℃의 비교적 서늘한 기후에 적당한 온대북부과수이다. 우리나라는 사과재배에 기온이 알맞고 사과나무 재배가 가능한 유효경사지가 많기 때문에 전체 과수 재배면적의 약 40%를 차지하고 있다. 우리나라의 주산지도 기상상태가 특이한 대구지방을 제외하고는 연평균 기온이 8~12℃ 전후인 예산, 충주와 북부지방인 사리원, 환주, 남포였었다. 그리고 사과는 연평균 기온이 8~11℃의 비교적 서늘한 기후에 적당한 온대북부과수이다."),
        DetailAnswer(question: "Q. 무엇을 개선해야 할까요?", answer: "사과는 연평균 기온이 8~11℃의 비교적 서늘한 기후에 적당한 온대북부과수이다. 우리나라는 사과재배에 기온이 알맞고 사과나무 재배가 가능한 유효경사지가 많기 때문에 전체 과수 재배면적의 약 40%를 차지하고 있다. 우리나라의 주산지도 기상상태가 특이한 대구지방을 제외하고는 연평균 기온이 8~12℃ 전후인 예산, 충주와 북부지방인 사리원, 환주, 남포였었다. 그리고 사과는 연평균 기온이 8~11℃의 비교적 서늘한 기후에 적당한 온대북부과수이다. 우리나라는 사과재배에 기온이 알맞고 사과나무 재배가 가능한 유효경사지가 많기 때문에 전체 과수 재배면적의 약 40%를 차지하고 있다."),
        DetailAnswer(question: "Q. 가장 힘든 점이 무엇이었나요?"),
        DetailAnswer(question: "Q. 왜 어려웠나요?"),
    ]
    
    private enum Constants {
        static let summaryHorizontalPadding: CGFloat = 33
        static let summaryVerticalPadding: CGFloat = 27
        
        static let rowBottomPadding: CGFloat = 15
        static let bottomSpacer: CGFloat = 49
    }
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0) {
                DetailSummary(period: period,
                              averageEvaluation: averageEvaluation,
                              averageAchievement: averageAchievement,
                              feeling: .excellent)
                    .padding(.horizontal, Constants.summaryHorizontalPadding)
                    .padding(.bottom, Constants.summaryVerticalPadding)
                
                ForEach(questions) { (question) in
                    DetailAnswerRow(question: question.question,
                                    content: question.answer, isEditable: true)
                }
                .padding(.bottom, Constants.rowBottomPadding)
                Spacer(minLength: Constants.bottomSpacer)
            }
        }
        .background(CustomColor.bgColor.edgesIgnoringSafeArea(.bottom))
        .navigationBarTitle(navigationBarTitle, displayMode: .inline)
    }
}

//MARK: - 더미데이터 구조체
struct DetailAnswer: Identifiable {
    var id = UUID()
    var question: String
    var answer: String?
}

struct RetrospectDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RetrospectDetailView()
    }
}
