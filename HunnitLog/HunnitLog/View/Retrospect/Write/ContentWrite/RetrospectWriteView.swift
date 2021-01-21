//
//  RetrospectWriteView.swift
//  HunnitLog
//
//  Created by Kang, Su Jin (강수진) on 2020/12/13.
//

import SwiftUI

struct RetrospectWriteView: View {
    
    // MARK: - 더미데이터
    let title = "Q. 무엇이 가장 만족스러우신가요?"
    @State var content = "질문에 대한 답변을 작성해주세요."
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    
    var isNext: Bool {
        if content == Constants.contentPlaceHolder {
            return false
        } else if content.isEmpty {
            return false
        }
        return true
    }
    
    private enum Constants {
        static let top: CGFloat = 27
        static let bottom: CGFloat = 21
        static let horizontalPadding: CGFloat = 33
        
        static let titleFont: Font = .system(size: 17, weight: .bold)
        static let titleBottom: CGFloat = 20
        
        static let dismissButtonImageName: String = "icBoxClose"
        static let dismissButtonWidth: CGFloat = 44
        static let dismissButtonHeight: CGFloat = dismissButtonWidth
        static let dismissButtonTrailing: CGFloat = 8
        
        static let contentPlaceHolder = "질문에 대한 답변을 작성해주세요."
        static let contentBottom: CGFloat = 37
        
        static let buttonFont: Font = .system(size: 15, weight: .medium)
        static let buttonHeight: CGFloat = 50
        static let buttonRadius: CGFloat = 8
    }
    
    var body: some View {
        VStack(spacing: 0) {
            //MARK: - 제목
            HStack {
                Text(title)
                    .foregroundColor(CustomColor.black)
                    .padding(.leading, Constants.horizontalPadding)
                Spacer()
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(Constants.dismissButtonImageName)
                        .resizable()
                        .frame(width: Constants.dismissButtonWidth, height: Constants.dismissButtonHeight)
                        .foregroundColor(.black)
                        .padding(.trailing, Constants.dismissButtonTrailing)
                })
            }
            .padding(.bottom, Constants.titleBottom)
           
            //MARK: - 내용
            TextView(text: $content)
                .padding(.horizontal, Constants.horizontalPadding)
                .padding(.bottom, Constants.contentBottom)

            //MARK: - 확인 버튼
            Button(action: {
                //TODO: - 확인 동작
                print(content)
            }, label: {
                Text("확인")
                    .foregroundColor(isNext ? CustomColor.black : CustomColor.gray)
                    .font(Constants.buttonFont)
                    .frame(maxWidth: .infinity,
                           maxHeight: Constants.buttonHeight,
                           alignment: .center)
                    .background(isNext ? CustomColor.yellow : CustomColor.lightGray)
                    .cornerRadius(Constants.buttonRadius)
            })
            .padding(.horizontal, Constants.horizontalPadding)
        }
        .padding(.top, Constants.top)
        .padding(.bottom, Constants.bottom)
    }
}

struct RetrospectWriteView_Previews: PreviewProvider {
    static var previews: some View {
        RetrospectWriteView()
    }
}

