//
//  TagView.swift
//  HunnitLog
//
//  Created by seungwook.jung on 2020/11/24.
//

import SwiftUI

struct TagButton: View {
    private let title: String
    private let buttonAction: (() -> Void)
    
    @State var isSelected: Bool = false
    
    private enum Constants {
        static let cornerRadius: CGFloat = 9
        static let borderWidth: CGFloat = 0.5
        static let verticalPadding: CGFloat = 9.5
        static let horizontalPadding: CGFloat = 16.5
        static let titleFont: Font = .custom("AppleSDGothicNeo-Medium", size: 13)
        static let letterSpacing: CGFloat = -0.39
    }
    
    init(title: String, action: @escaping (() -> Void)) {
        self.title = title
        self.buttonAction = action
    }
    
    var body: some View {
        Button(action: self.buttonAction) {
            Text(self.title)
                .font(Constants.titleFont)
                .kerning(Constants.letterSpacing)
                .padding(EdgeInsets(top: Constants.verticalPadding,
                                    leading: Constants.horizontalPadding,
                                    bottom: Constants.verticalPadding,
                                    trailing: Constants.horizontalPadding))
                .background(self.isSelected ? CustomColor.gray : Color.clear)
                .foregroundColor(self.isSelected ? .white : CustomColor.darkGray)
                .cornerRadius(Constants.cornerRadius)
                .overlay(RoundedRectangle(cornerRadius: Constants.cornerRadius)
                            .stroke(CustomColor.gray,
                                    lineWidth: Constants.borderWidth))
        }
    }
}

struct TagView_Previews: PreviewProvider {
    static let isSelected = false
    static var previews: some View {
        TagButton(title: "자격증 따기") {
            print("action")
        }
    }
}
