//
//  ScoreRow.swift
//  HunnitLog
//
//  Created by 초이 on 2020/12/05.
//

import SwiftUI

struct ScoreRow: View {
    @State private var sliderValue: Double = 0
    
    let step: Double = 1
    var roundedValue: Double
    
    let title: String
    let achievement: Int
    
    private enum Constants {
        static let horizontalPadding: CGFloat = 18
        static let verticalPadding: CGFloat = 15
        static let trailing: CGFloat = 10
        static let circleRadius: CGFloat = 47
        static let titleFont: Font = .system(size: 17)
        static let achievementFont: Font = .system(size: 13)
        static let borderWidth: CGFloat = 0.3
        static let borderRadius: CGFloat = 13
        
        static let sliderMinValue: CGFloat = -5
        static let sliderMaxValue: CGFloat = 5
        
        static let badImageName: String = "imgTextboxBad"
        static let notBadImageName: String = "imgTextboxNotbad"
        static let sosoImageName: String = "imgTextboxSoso"
        static let greatImageName: String = "imgTextboxGreat"
        static let excellentImageName: String = "imgTextboxExcellent"
    }
    
    
    var body: some View {
        let roundedValue = round(sliderValue/step)*step
        
        HStack(spacing: 7){
            VStack{
                HStack{
                    Circle()
                        .fill(CustomColor.yellow)
                        .frame(width: Constants.circleRadius, height: Constants.circleRadius)
                        .padding(.trailing, Constants.trailing)
                        
                    VStack{
                        HStack{
                            Text(title)
                                .font(Constants.titleFont)
                                Spacer()
                        }
                        HStack{
                            Text("달성률 \(achievement)%")
                                .font(Constants.achievementFont)
                                .foregroundColor(CustomColor.coolGray)
                            Spacer()
                        }
                    }
                }
                
                GeometryReader { geometry in
                    VStack {
                        HStack{
                            
                            switch roundedValue {
                            case -5 ... -4:
                                Image(Constants.badImageName)
                                    .frame(width: CGFloat(geometry.size.width / 10 * CGFloat(5.9 + sliderValue)), height: 32, alignment: .bottomTrailing)
                            case -3 ... -2:
                                Image(Constants.notBadImageName)
                                    .frame(width: CGFloat(geometry.size.width / 10 * CGFloat(5.9 + sliderValue)), height: 32, alignment: .bottomTrailing)
                            case -1 ... 1:
                                Image(Constants.sosoImageName)
                                    .frame(width: CGFloat(geometry.size.width / 10 * CGFloat(5.9 + sliderValue)), height: 32, alignment: .bottomTrailing)
                            case 2 ... 3:
                                Image(Constants.greatImageName)
                                    .frame(width: CGFloat(geometry.size.width / 10 * CGFloat(5.9 + sliderValue)), height: 32, alignment: .bottomTrailing)
                            default:
                                Image(Constants.excellentImageName)
                                    .frame(width: CGFloat(geometry.size.width / 10 * CGFloat(5.9 + sliderValue)), height: 32, alignment: .bottomTrailing)
                            }
                            Spacer()
                        }
                        Slider(value: $sliderValue, in: -5...5)
                        .accentColor(CustomColor.lightGray)
                    }
                }
                .frame(height: 70)
                HStack {
                    Text("-5")
                    Spacer()
                    Text("-3")
                    Spacer()
                    Text("0")
                    Spacer()
                    Text("+3")
                    Spacer()
                    Text("+5")
                }
            }
        }
        .padding(.horizontal, Constants.horizontalPadding)
        .padding(.vertical, Constants.verticalPadding)
        .background(Color.white)
        .makeRoundedWithBorder(CustomColor.gray, width:Constants.borderWidth, cornerRadius: Constants.borderRadius)
    }
}

struct ScoreRow_Previews: PreviewProvider {
    static var previews: some View {
        ScoreRow(roundedValue: 0, title: "목표제목입니다목표제목입니다목표제목입니다목표제목입니다목표제목입니다", achievement: 20)
    }
}
