//
//  Tracker.swift
//  simpleMVVM
//
//  Created by seungwook.jung on 2020/11/07.
//

import Foundation

enum TrackEventType {
    case listView
}

protocol TrackerType {
    func log(type: TrackEventType)
}

final class Tracker: TrackerType {
    func log(type: TrackEventType) {
        //TODO: - logging
    }
}
