//
//  RetrospectQuestionView.swift
//  HunnitLog
//
//  Created by seungwook.jung on 2020/12/01.
//

import SwiftUI

struct RetrospectQuestionView: View {
    private enum Constants {
        static let font: Font = .system(size: 17)
        static let addIconFont: Font = .system(size: 24)
        static let addButtonFont: Font = .system(size: 14, weight: .medium)
    }
    
    init() {
        let lightGray = UIColor(red: 236/255, green: 242/255, blue: 242/255, alpha: 1)
        UITableViewCell.appearance().backgroundColor = lightGray
        UITableView.appearance().separatorStyle = .none
    }
    
    @State var questions: [RetrospectQuestionViewModel] = [
        RetrospectQuestionViewModel(question: "무엇이 가장 만족스러운가요?"),
        RetrospectQuestionViewModel(question: "가장 큰 성장은 무엇이었나요?"),
        RetrospectQuestionViewModel(question: "아쉬운 점은 없었나요?"),
        RetrospectQuestionViewModel(question: "무엇을 개선해야 할까요?"),
        RetrospectQuestionViewModel(question: "도움을 준 사람은 누구인가요?"),
    ]
    
    @State var newQuestion: String = ""
    
    var body: some View {
        VStack {
            // MARK: -  item list
            ForEach(self.questions) { model in
                HStack(alignment: .center) {
                    Button(action: {
                        guard let index = self.questions.firstIndex(where: { model.id == $0.id }) else {
                            return
                        }
                        self.questions[index].isSelected = !model.isSelected
                    }, label: {
                        if model.isSelected {
                            ZStack {
                                Circle()
                                    .fill(CustomColor.black)
                                    .frame(width: 23, height: 23)
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.system(size: 24))
                                    .foregroundColor(CustomColor.yellow)
                                
                            }
                            .frame(width: 24, height: 24)
                        } else {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 24, height: 24)
                        }
                    }).padding(.leading, 21)
                    Text(model.question)
                }.frame(width: 343, height: 68, alignment: .leading)
            }
            
            // MARK: - add item
            HStack {
                Image(systemName: "plus")
                    .font(.system(size: 20))
                    .padding(.leading, 21)
                TextField("직접 입력해 주세요.", text: $newQuestion)
                    .font(Constants.font)
                Button(action: {
                    self.questions.append(RetrospectQuestionViewModel(question: self.newQuestion))
                    self.newQuestion = ""
                }, label: {
                    Text("추가")
                        .font(Constants.addButtonFont)
                        .foregroundColor(.white)
                })
                .frame(width: 48, height: 28, alignment: .center)
                .background(CustomColor.gray)
                .cornerRadius(16)
                .padding(.trailing, 21)
            }
            .frame(width: 343, height: 68, alignment: .leading)
        }
        .background(CustomColor.lightGray)
        .cornerRadius(13)
    }
    
}

struct RetrospectQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        RetrospectQuestionView()
    }
}
