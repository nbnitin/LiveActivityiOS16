//
//  LiveActivityPart1WidgetLiveActivity.swift
//  LiveActivityPart1Widget
//
//  Created by Nitin Bhatia on 23/11/22.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct LiveActivityPart1WidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var value: Int
        var dd : Date
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
    var id = UUID()
}

struct LiveActivityPart1: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: LiveActivityPart1WidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)
            
        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom")
                    // more content
                }
            } compactLeading: {
                    
                    HStack(alignment: .center) {
                        Text("L \(context.state.value)" )
                        Text(context.state.dd, style: .date)
                            .multilineTextAlignment(.center)
                            
                            .font(.caption2)
                    }
            } compactTrailing: {
                Text("T")
            } minimal: {
                VStack(alignment: .center) {
                    Image(systemName: "timer")
                    Text(context.state.dd, style: .timer)
                        .multilineTextAlignment(.center)
                        .monospacedDigit()
                        .font(.caption2)
                }
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}
