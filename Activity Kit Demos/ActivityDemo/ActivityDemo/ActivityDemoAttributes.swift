//
//  ActivityDemoAttributes.swift
//  ActivityDemo
//
//  Created by Nitin Bhatia on 23/11/22.
//

import Foundation
import SwiftUI
import ActivityKit

struct ActivityDemoAppAttributes: ActivityAttributes, Identifiable {
    public typealias LiveDeliveryData = ContentState

    public struct ContentState: Codable, Hashable {
        var courierName: String
        var deliveryTime: Date
    }
    var numberOfGroceyItems: Int
    var id = UUID()
}

