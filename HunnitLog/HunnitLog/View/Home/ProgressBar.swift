//
//  ProgressBar.swift
//  HunnitLog
//
//  Created by 초이 on 2020/11/26.
//

import SwiftUI

struct ProgressBar: View{
    @State private var progressValue = 25.0
    @State private var progressTotal = 100.0
    
    var body: some View {
        VStack{
            Text("D-78")
                .font(.system(size: 30))
                .fontWeight(.semibold)
                .frame(height:47)
                .padding(.top, 28)
            Text("다음 회고: 20.11.16 월")
                .font(.system(size: 12))
                .fontWeight(.medium)
                .foregroundColor(.gray)
            ProgressView(value: progressValue, total: progressTotal)
                .padding(.horizontal, 33)
                .padding(.top, 27)
                .progressViewStyle(HoneyBeeProgressViewStyle(value: $progressValue, total: $progressTotal))
            HStack{
                Text("조금만 더 힘내요! 현재 25% 달성했어요.")
                    .font(.system(size: 13))
                Spacer()
            }
            .padding(.horizontal, 33)
        }
    }
}

struct HoneyBeeProgressViewStyle: ProgressViewStyle {
    @Binding var value: Double
    @Binding var total: Double
    
    func makeBody(configuration: Configuration) -> some View {
        let offset = CGFloat(value) / 100
        return GeometryReader{ geometry in
            VStack(spacing:0){
                HStack{
                    Text("🐝")
                        .font(.system(size: 21))
                        .scaleEffect(x: -1, y: 1, anchor: .center)
                        .frame(width: CGFloat(geometry.size.width * offset + 15), height: 30, alignment: .bottomTrailing)
                    Spacer()
                    Text("🍯")
                        .font(.system(size: 23))
                        .frame(width: 24, height: 30, alignment: .bottomTrailing)
                }
                ProgressView(configuration)
                    .accentColor(CustomColor.yellow)
            }
        }
        .frame(height: 40)
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar()
    }
}

