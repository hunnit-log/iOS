//
//  AchievementItemView.swift
//  HunnitLog
//
//  Created by seungwook.jung on 2020/12/01.
//

import SwiftUI

struct AchievementItemView: View {
    @State var item: AchievementItemViewModel = AchievementItemViewModel(editable: true, title: "")
    //Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do
    
    let action: () -> Void
    
    private enum Constants {
        static let contentWidth: CGFloat = 309
        static let font: Font = .system(size: 17)
        static let textCounterFont: Font = .system(size: 11)
    }
    
    private var backgroundColor: Color {
        self.item.editable ? .white : CustomColor.yellow
    }
    
    var body: some View {
        if self.item.editable {
            ZStack {
                TextField("목표를 입력해 주세요.", text: $item.title)
                    .font(Constants.font)
                    .multilineTextAlignment(.center)
                    .lineLimit(1)
                    .foregroundColor(CustomColor.black)
                    .padding(.horizontal, 24)
                    .frame(width: Constants.contentWidth, height: 65)
                    .overlay(RoundedRectangle(cornerRadius: 10)
                                .stroke(CustomColor.yellow,
                                        lineWidth: 1))
                
                Text("\(item.letterCount)/25")
                    .font(Constants.textCounterFont)
                    .foregroundColor(CustomColor.gray)
                    .padding(.trailing, 10)
                    .padding(.bottom, 7)
                    .frame(width: Constants.contentWidth, height: 65, alignment: .bottomTrailing)
            }
        } else {
            HStack {
                Spacer()
                Text(self.item.title)
                    .font(Constants.font)
                    .foregroundColor(CustomColor.black)
                    .frame(maxWidth: 237)
                    .lineLimit(1)
                Spacer()
                Button(action: self.action) {
                    Image("ic_delete")
                }.frame(width: 21, height: 21).padding(.trailing, 19)
            }
            .frame(width: Constants.contentWidth, height: 65)
            .background(self.backgroundColor)
            .cornerRadius(10)
        }
    }
}

struct AchievementItemView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementItemView(action: {})
    }
}
