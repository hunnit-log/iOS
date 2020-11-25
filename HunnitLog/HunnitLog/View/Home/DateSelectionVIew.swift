//
//  DateSelectionVIew.swift
//  HunnitLog
//
//  Created by 초이 on 2020/11/26.
//

import SwiftUI

struct DateSelectionVIew: View {
    var body: some View {
        HStack{
            Button(action: {
                
            }, label: {
                HStack(spacing: 8){
                    Text("2020.11.05")
                        .foregroundColor(.black)
                        .font(.system(size: 18))
                    Image(systemName: "arrowtriangle.down.fill")
                        .resizable()
                        .frame(width: 9, height: 7)
                        .foregroundColor(.black)
                }
            })
            Spacer()
            Button(action: dosth){
                Text("편집")
            }
            .buttonStyle(homeButtonStyle())
            Button(action: dosth){
                Text("점수입력")
            }
            .buttonStyle(homeButtonStyle())
        }
        .padding(.horizontal, 33)
    }
}


// MARK: - fake action function
func dosth(){
    print("a")
}


struct buttonBackGroundView: View{
    var body: some View {
        Rectangle()
            .fill(Color.white)
            .cornerRadius(5)
            .addRoundedBorder(CustomColor.gray, width: 0.4, cornerRadius: 5)
    }
}

struct homeButtonStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .font(.system(size: 12))
                .padding(.horizontal, 6)
                .padding(.vertical, 5)
                .foregroundColor(CustomColor.darkGray)
                .background(buttonBackGroundView())
    }
}

struct DateSelectionVIew_Previews: PreviewProvider {
    static var previews: some View {
        DateSelectionVIew()
    }
}
