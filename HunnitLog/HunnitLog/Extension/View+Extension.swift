//
//  View+Extension.swift
//  HunnitLog
//
//  Created by Kang, Su Jin (강수진) on 2020/11/24.
//

import SwiftUI

extension View {
    func customAlert(isPresented: Binding<Bool>, content: () -> CustomAlert) -> some View {
        if isPresented.wrappedValue {
            
            let customAlertVC = CustomAlertHostingController(view: content(), isPresented: isPresented)
            customAlertVC.modalPresentationStyle = .overCurrentContext
            customAlertVC.view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.25)
            customAlertVC.modalTransitionStyle = .crossDissolve
            
            let rootVC = UIApplication.shared.windows.first?.rootViewController
            rootVC?.present(customAlertVC, animated: true, completion: nil)
        }
        
        return self
    }
}
// MARK: - RoundedCorner

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
