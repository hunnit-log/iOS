//
//  TagButton.swift
//  HunnitLog
//
//  Created by seungwook.jung on 2020/11/24.
//

import SwiftUI

struct TagButton: View {
    @State var item: TagButtonViewModel
    let buttonAction: ((TagButtonViewModel) -> Void)
    
    private enum Constants {
        static let cornerRadius: CGFloat = 9
        static let borderWidth: CGFloat = 0.5
        static let verticalPadding: CGFloat = 9.5
        static let horizontalPadding: CGFloat = 16.5
        static let titleFont: Font = .custom("AppleSDGothicNeo-Medium", size: 13)
        static let letterSpacing: CGFloat = -0.39
    }
    
    var body: some View {
        Button(action: {
            self.item.isSelected = !self.item.isSelected
            self.buttonAction(self.item)
        }) {
            Text(self.item.title)
                .font(Constants.titleFont)
                .kerning(Constants.letterSpacing)
                .padding(EdgeInsets(top: Constants.verticalPadding,
                                    leading: Constants.horizontalPadding,
                                    bottom: Constants.verticalPadding,
                                    trailing: Constants.horizontalPadding))
                .background(self.item.isSelected ? CustomColor.gray : Color.clear)
                .foregroundColor(self.item.isSelected ? .white : CustomColor.darkGray)
                .cornerRadius(Constants.cornerRadius)
                .overlay(RoundedRectangle(cornerRadius: Constants.cornerRadius)
                            .stroke(CustomColor.gray,
                                    lineWidth: Constants.borderWidth))
        }
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        var model: TagButtonViewModel = TagButtonViewModel(title: "자격증 따기")
        TagButton(item: model) {
            print($0)
        }
    }
}
