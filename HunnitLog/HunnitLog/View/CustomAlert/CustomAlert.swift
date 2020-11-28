//
//  CustomAlert.swift
//  HunnitLog
//
//  Created by Kang, Su Jin (강수진) on 2020/11/24.
//

import SwiftUI

struct CustomAlert: View {
    
    private var title: Text
    private var message: Text?
    private var buttons: [CustomAlert.Button?]?
    
    init(title: Text, message: Text? = nil, primaryButton: CustomAlert.Button? = .default(Text("확인")), secondaryButton: CustomAlert.Button? = nil) {
        self.title = title
        self.message = message
        self.buttons = [primaryButton, secondaryButton]
    }
    
    var body: some View {
        VStack {
            title
                .padding(.bottom, 9)
                .foregroundColor(Color.black)
                .font(.system(size: 18))
            
            message
                .padding(.bottom, 35)
                .foregroundColor(CustomColor.coolGray)
                .font(.system(size: 15))
            
            if let buttonStack = buttons {
                HStack {
                    ForEach((0...(buttonStack.count-1)), id: \.self) {
                        buttonStack[$0]
                    }
                }
            }
        }
        .padding(.top, 36)
        .padding(.bottom, 24)
        .padding(.horizontal, 22)
        .background(Color.white)
        .cornerRadius(10)
        .padding(.horizontal, 16)
    }
}


// MARK: - Button
fileprivate typealias SystemButton = Button
extension CustomAlert {
    enum ButtonType {
        case `default`
        case cancel
    }
    
    struct Button: View {
        private let text: Text
        private let buttonType: CustomAlert.ButtonType
        private let buttonAction: (() -> Void)?
        
        private init(text: Text, buttonType: CustomAlert.ButtonType, action: (() -> Void)? = {}) {
            self.text = text
            self.buttonType = buttonType
            self.buttonAction = action
        }
        
        var body: some View {
            SystemButton(action: {
                //alert가 띄워져 있는 최상위부터 dismiss 한 후에 action을 perform
                if let customAlertVC =
                    UIApplication.shared.windows.first?.rootViewController?.presentedViewController as? CustomAlertHostingController {
                    customAlertVC.dismiss(animated: true) {
                        if let action = self.buttonAction {
                            action()
                        }
                    }
                }
            }, label: {
                text
                    .frame(maxWidth: .infinity, minHeight: 50)
                    .font(.system(size: 15))
                    .foregroundColor( buttonType == .default ? CustomColor.black : CustomColor.coolGray)
                    .background(buttonType == .default ? CustomColor.yellow : CustomColor.lightGray)
                    .cornerRadius(10)
            })
        }
        
        // button types
        static func `default`(_ label: Text, action: (() -> Void)? = {}) -> CustomAlert.Button {
            return CustomAlert.Button(text: label, buttonType: .default, action: action)
        }
        
        static func cancel(_ label: Text = Text("취소"), action: (() -> Void)? = {}) -> CustomAlert.Button {
            return CustomAlert.Button(text: label, buttonType: .cancel, action: action)
        }
                    
    }
}
