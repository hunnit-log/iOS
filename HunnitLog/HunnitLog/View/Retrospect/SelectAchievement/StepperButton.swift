//
//  StepperButton.swift
//  HunnitLog
//
//  Created by Kang, Su Jin (강수진) on 2020/12/06.
//

import SwiftUI

struct StepperButton: View {
    private enum Constants {
        static let iconWidth: CGFloat = 25
        static let iconHeight: CGFloat = iconWidth
        
        static let stepperValue: Double = 5
    }
    
    enum StepperType {
        case minus
        case plus
    }
    
    let type: StepperType
    @Binding var percentage: Double
    
    var body: some View {
        Button(action: {
            var calculationResult: Double
            
            switch type {
            case .minus:
                calculationResult = percentage - Constants.stepperValue
            case .plus:
                calculationResult = percentage + Constants.stepperValue
            }
            
            if (0...100).contains(calculationResult) {
                percentage = calculationResult
            }
        }, label: {
            Image(systemName: "\(type).circle.fill")
                .resizable()
                .frame(width: Constants.iconWidth,
                       height: Constants.iconHeight)
                .foregroundColor(CustomColor.black)
        })
    }
}

struct StepperButton_Previews: PreviewProvider {
    @State static var percentage: Double = 75
    
    static var previews: some View {
        HStack {
            StepperButton(type: .minus, percentage: $percentage)
            StepperButton(type: .plus, percentage: $percentage)
        }
    }
}
