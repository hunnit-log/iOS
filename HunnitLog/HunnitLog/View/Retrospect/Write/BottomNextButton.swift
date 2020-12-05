//
//  BottomNextButton.swift
//  HunnitLog
//
//  Created by Kang, Su Jin (강수진) on 2020/12/05.
//

import SwiftUI

struct BottomNextButton: View {
    
    enum NextType: String {
        case next = "다음"
        case ok = "확인"
    }
    
    let geometry: GeometryProxy
    let type: NextType
    let buttonAction: (() -> Void)
    
    private enum Constants {
        static let height: CGFloat = 59
        static let titleFont: Font = .system(size: 18, weight: .medium)
        static let titleLineSpaceing: CGFloat = -0.54
    }
    
    var body: some View {
        Button(action: buttonAction) {
            Text(type.rawValue)
                .foregroundColor(CustomColor.black)
                .font(Constants.titleFont)
                .kerning(Constants.titleLineSpaceing)
                .frame(maxWidth: .infinity,
                       maxHeight: Constants.height,
                       alignment: .center)
                .padding(.bottom, geometry.safeAreaInsets.bottom)
                .background(CustomColor.yellow)
        }
    }
}

struct BottomNextButton_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            BottomNextButton(geometry: geometry,
                             type: .next,
                             buttonAction: {
                                print("next")
                             })
        }
    }
}
