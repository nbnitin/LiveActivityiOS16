//
//  LiveActivityAttributes.swift
//  LiveActivityUsingUIKit
//
//  Created by Nitin Bhatia on 28/11/22.
//

import SwiftUI
import ActivityKit

struct LiveActivityAttributes : ActivityAttributes {
    typealias dynamicContent = ContentState
    
    struct ContentState : Codable, Hashable {
        var updateTime : Date
    }
    
    var name : String
}
