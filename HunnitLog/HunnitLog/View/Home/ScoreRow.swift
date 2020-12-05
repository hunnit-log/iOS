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
    
    let title: String
    let achievement: Int
    
    private enum Constants {
        static let horizontalPadding: CGFloat = 18
        static let verticalPadding: CGFloat = 15
        static let trailing: CGFloat = 10
        static let circleDiameter: CGFloat = 47
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
        HStack(spacing: 7) {
            VStack{
                HStack{
                    Circle()
                        .fill(CustomColor.yellow)
                        .frame(width: Constants.circleDiameter, height: Constants.circleDiameter)
                        .padding(.trailing, Constants.trailing)
                    
                    VStack(alignment: .leading) {
                        Text(title)
                            .font(Constants.titleFont)
                        Text("달성률 \(achievement)%")
                            .font(Constants.achievementFont)
                            .foregroundColor(CustomColor.coolGray)
                    }
                }
                
                GeometryReader { geometry in
                    VStack {
                        HStack{
                            Emotion(rawValue: makeScore(sliderValue))?
                                .image
                                .frame(width: CGFloat(geometry.size.width / 10 * CGFloat(5.9 + sliderValue)), height: 32, alignment: .bottomTrailing)
                            Spacer()
                        }
                        Slider(value: $sliderValue, in: -5...5)
                            .accentColor(CustomColor.lightGray)
                    }
                }
                .frame(height: 70)
                HStack {
                    ForEach(Emotion.allCases) { emotion in
                        Text("\(emotion.rawValue)")
                        if emotion != .excellent {
                            Spacer()
                        }
                    }
                }
            }
        }
        .padding(.horizontal, Constants.horizontalPadding)
        .padding(.vertical, Constants.verticalPadding)
        .background(Color.white)
        .makeRoundedWithBorder(CustomColor.gray, width:Constants.borderWidth, cornerRadius: Constants.borderRadius)
    }
}

extension ScoreRow {
    // CaseIterable 은 아래서 Emotion.allCases 를 사용하기 위해 컨펌 해 주었습니다.
    // Identifiable 은 ForEach 에서 사용하기 위해 컨펌해주었고, 해당 프로토콜을 따르려면 id 변수를 정의해주어야합니다.
    private enum Emotion: Int, CaseIterable, Identifiable {
        case bad = -5
        case notbad = -3
        case soso = 0
        case great = 3
        case excellent = 5
        
        var image: Image? {
            Image(self.imageName)
        }
        
        var id: Int {
            self.rawValue
        }
        
        private var imageName: String {
            switch self {
            case .bad:
                return "imgTextboxBad"
            case .notbad:
                return "imgTextboxNotbad"
            case .soso:
                return "imgTextboxSoso"
            case .great:
                return "imgTextboxGreat"
            case .excellent:
                return "imgTextboxExcellent"
            }
            
        }
    }
    
    
    // MARK: makeScore - slider의 값을 정해진 점수로 보정해주는 함수입니다.
    func makeScore(_ sliderValue: Double) -> Int {
        let roundedValue = Int(round(sliderValue/step)*step)
        var score: Int
        if(roundedValue % 2 == 0 && roundedValue != 0){
            if(roundedValue < 0){
                score = roundedValue - 1
            }else{
                score = roundedValue + 1
            }
        }else if(abs(roundedValue) == 1){
            return 0
            
        }else{
            score = roundedValue
            return score
        }
        
        return score
    }
}


struct ScoreRow_Previews: PreviewProvider {
    static var previews: some View {
        ScoreRow(title: "목표제목입니다목표제목입니다목표제목입니다목표제목입니다목표제목입니다", achievement: 20)
    }
}
