//
//  LiveActivityWidgetUsingUIKit.swift
//  LiveActivityWidgetUsingUIKit
//
//  Created by Nitin Bhatia on 28/11/22.
//

import WidgetKit
import SwiftUI
import ActivityKit

struct LiveActivityWidgetUsingUIKit: Widget {
    let kind: String = "LiveActivityWidgetUsingUIKit"
    
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: LiveActivityAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello")
                Text(context.state.updateTime,style : .timer)
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)
            
        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                        Text("Hello")
                        Text(context.state.updateTime,style : .timer)
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom")
                    // more content
                }
            } compactLeading: {
                
                VStack(alignment: .center) {
                    Text("\(context.attributes.name)" )
                    Text(context.state.updateTime, style: .timer)
                        .multilineTextAlignment(.center)
                    
                        .font(.caption2)
                }
            } compactTrailing: {
                Text("T")
            } minimal: {
                VStack(alignment: .center) {
                    Text("Hello")
                    Text(context.state.updateTime, style: .timer)
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


