//
//  TextView.swift
//  HunnitLog
//
//  Created by Kang, Su Jin (강수진) on 2020/12/13.
//

import SwiftUI

struct TextView: UIViewRepresentable {
    private enum Constants {
        static let placeHolder = "질문에 대한 답변을 작성해주세요."
        static let placeHolderColor = UIColor(CustomColor.gray)
        static let font: UIFont = UIFont.systemFont(ofSize: 16)
        static let contentColor = UIColor(CustomColor.black)
    }
    
    @Binding var text: String
    
    //view object 생성 및 초기화
    func makeUIView(context: Context) -> UITextView {
        let textView = UITextView()
 
        textView.font = Constants.font
        textView.textColor = Constants.placeHolderColor
        textView.text = Constants.placeHolder
        
        textView.becomeFirstResponder()
 
        //textView에 coordinator 을 할당
        textView.delegate = context.coordinator
        
        return textView
    }
 
    //UIKit view의 상태 업데이트. SwiftUI 에서 상태 변경이 있을때 호출 됨.
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
    
    //위의 두 메소드만 구현하면 UITextView에 입력된 text와 우리의 text 변수가 sync 되지 않음. 따라서 UITextViewDelegate protocol의 textViewDidChange 함수를 이용해야하는데, UIKit의 delegate와 SwiftUI를 연결시키기 위해서는 makeCoordinator method를 구현하고 Coordinator를 제공해야함. 이 Coordinator는 UIView의 delegate와 SwiftUI의 bridge 역할을 함.
    func makeCoordinator() -> Coordinator {
        Coordinator($text)
    }
    
    //Coordinator는 UITextViewDelegate protocol를 채택하고 textViewDidChange method를 구현
    class Coordinator: NSObject, UITextViewDelegate {
        var text: Binding<String>
        
        init(_ text: Binding<String>) {
            self.text = text
        }
        
        func textViewDidChange(_ textView: UITextView) {
            guard var text = textView.text else {
                return
            }
            
            //placeholder가 존재한다면 제거
            if text.hasPrefix(Constants.placeHolder) {
                text = String(text.dropFirst(Constants.placeHolder.count))
            }
            
            //변경된 텍스트를 text binding에 update 해줌으로써 SwiftUI에 전달
            self.text.wrappedValue = text
        }
    }
}


struct TextView_Previews: PreviewProvider {
    @State static var text = "hello"
    static var previews: some View {
        TextView(text: $text)
    }
}
