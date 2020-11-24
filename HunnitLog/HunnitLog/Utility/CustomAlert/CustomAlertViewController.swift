//
//  CustomAlertViewController.swift
//  HunnitLog
//
//  Created by Kang, Su Jin (강수진) on 2020/11/24.
//

import SwiftUI

//alert를 present할 VC
class CustomAlertViewController: UIHostingController<CustomAlert> {
    
    private var customAlert: CustomAlert
    private var isPresented: Binding<Bool>
    
    init(view: CustomAlert, isPresented: Binding<Bool>) {
        self.customAlert = view
        self.isPresented = isPresented
        super.init(rootView: self.customAlert)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        self.isPresented.wrappedValue =  false
    }
    
    deinit {
        print("deinit \(self)")
    }
}
