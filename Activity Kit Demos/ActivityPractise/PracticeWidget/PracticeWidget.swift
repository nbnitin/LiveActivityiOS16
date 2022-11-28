//
//  PracticeWidget.swift
//  PracticeWidget
//
//  Created by Nitin Bhatia on 25/11/22.
//

import WidgetKit
import SwiftUI
import ActivityKit

struct TimerActivityView : View {
    
    let context : ActivityViewContext<TimerAttributes>
    
    var body: some View {
        VStack(alignment: .center) {
            Text(context.attributes.timerName)
            
            Text(context.state.endTime, style: .timer)
        }
        .padding(.horizontal)
    }
}


struct PracticeWidget: Widget {
    let kind: String = "PracticeWidget"

    var body: some WidgetConfiguration {
        ActivityConfiguration(for: TimerAttributes.self) {context in
         
            TimerActivityView(context : context)
            
            
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
                    
                    
            } compactTrailing: {
                Text("T")
            } minimal: {
                VStack(alignment: .center) {
                    Image(systemName: "timer")
                    Text(context.state.endTime, style: .timer)
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

