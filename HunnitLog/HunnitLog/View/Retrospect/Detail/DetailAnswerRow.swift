//
//  DetailAnswerRow.swift
//  HunnitLog
//
//  Created by Kang, Su Jin (강수진) on 2020/12/04.
//

import SwiftUI

struct DetailAnswerRow: View {
    
    let question: String
    let answer: String?
    let isEditable: Bool
    let isFromDetailView: Bool
    
    private var contentFont: Font {
        get {
            return isFromDetailView ? .system(size: 15) : .system(size: 14)
        }
    }
    
    private enum Constants {
        static let editTitle = "수정하기"
        static let editTitleFont: Font = .system(size: 12, weight: .semibold)
        static let editVerticalPadding: CGFloat = 5
        static let editHorizontalPadding: CGFloat = 7
        static let editCornerRadius: CGFloat = 7
        
        static let questionFont: Font = .system(size: 16, weight: .bold)
        
        static let contentTop: CGFloat = 15
        
        static let horizontalPadding: CGFloat = 33
        static let verticalPadding: CGFloat = 27
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(question)
                    .font(Constants.questionFont)
                    .foregroundColor(CustomColor.black)
                Spacer()
                Button(action: {
                    //TODO
                    print("edit button touched!")
                }, label: {
                    Text(Constants.editTitle)
                        .font(Constants.editTitleFont)
                        .foregroundColor(.white)
                        .padding(.vertical, Constants.editVerticalPadding)
                        .padding(.horizontal, Constants.editHorizontalPadding)
                        .background(CustomColor.darkGray)
                        .cornerRadius(Constants.editCornerRadius)
                })
                .opacity(isEditable ? 1 : 0)
            }
            
            if let content = answer {
                Text(content)
                    .font(contentFont)
                    .foregroundColor(CustomColor.black)
                    .padding(.top, Constants.contentTop)
            }
        }
        .padding(.horizontal, Constants.horizontalPadding)
        .padding(.vertical, Constants.verticalPadding)
        .background(Color.white)
        
    }
}

struct DetailAnswerRow_Previews: PreviewProvider {
    static var previews: some View {
        DetailAnswerRow(question: "질문", answer: "답변", isEditable: true, isFromDetailView: false)
    }
}
