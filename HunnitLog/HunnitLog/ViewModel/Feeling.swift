//
//  Feeling.swift
//  HunnitLog
//
//  Created by Kang, Su Jin (강수진) on 2020/11/30.
//

import SwiftUI

enum Feeling {
    case excellent
    case good
    case soso
    case notBad
    case bad
    
    var icon: Image {
        switch self {
        case .excellent:
            return Image("imgEmotExcellent")
        case .good:
            return Image("imgEmotGreat")
        case .soso:
            return Image("imgEmotSoso")
        case .notBad:
            return Image("imgEmotNotbad")
        case .bad:
            return Image("imgEmotBad")
        }
    }
}
