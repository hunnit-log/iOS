//
//  RoundedBackground.swift
//  HunnitLog
//
//  Created by 초이 on 2020/11/26.
//

import SwiftUI

struct RoundedBackground: View {
    var body: some View {
        VStack{
            Rectangle()
                .fill(Color.white)
                .frame(width: UIScreen.main.bounds.width)
                .cornerRadius(50, corners: [.bottomRight, .bottomLeft])
                .shadow(color: Color.init(.displayP3, red: 80/255, green: 80/255, blue: 80/255, opacity: 0.15), radius: 6, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                .edgesIgnoringSafeArea(.top)
        }
    }
}

struct RoundedBackground_Previews: PreviewProvider {
    static var previews: some View {
        RoundedBackground()
    }
}
