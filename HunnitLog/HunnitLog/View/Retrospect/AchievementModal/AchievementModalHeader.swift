//
//  AchievementModalHeader.swift
//  HunnitLog
//
//  Created by Kang, Su Jin (강수진) on 2020/11/28.
//

import SwiftUI

struct AchievementModalHeader: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    private let title: String
    
    init(title: String) {
        self.title = title
    }
    
    private enum Constants {
        static let leading: CGFloat = 33
        static let trailing: CGFloat = 18
        static let top: CGFloat = 29
        static let bottom: CGFloat = 10
        static let titleFont: Font = .system(size: 19)
        static let dismissButtonImageName: String = "xmark"
        static let dismissButtonWidth: CGFloat = 16
        static let dismissButtonHeight: CGFloat = 16
        static let dismissButtonPadding: CGFloat = 8
    }
    
    var body: some View {
        HStack {
            Text(title)
                .font(Constants.titleFont)
                .fontWeight(.bold)
                .foregroundColor(CustomColor.black)
            Spacer()
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Image(systemName: Constants.dismissButtonImageName)
                    .resizable()
                    .frame(width: Constants.dismissButtonWidth, height: Constants.dismissButtonHeight)
                    .foregroundColor(.black)
                    .padding(Constants.dismissButtonPadding)
            })
        }
        .padding(.leading, Constants.leading)
        .padding(.trailing, Constants.trailing)
        .padding(.top, Constants.top)
        .padding(.bottom, Constants.bottom)
        .background(Color.white)
    }
}
