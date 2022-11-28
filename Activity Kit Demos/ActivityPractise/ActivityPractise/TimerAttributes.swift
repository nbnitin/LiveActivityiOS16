//
//  TimerAttributes.swift
//  ActivityPractise
//
//  Created by Nitin Bhatia on 25/11/22.
//

import ActivityKit
import SwiftUI

struct TimerAttributes : ActivityAttributes {
    public typealias timerStatus = ContentState
    
    public struct ContentState : Codable, Hashable {
        var endTime : Date
    }
    
    var timerName : String
    
}
