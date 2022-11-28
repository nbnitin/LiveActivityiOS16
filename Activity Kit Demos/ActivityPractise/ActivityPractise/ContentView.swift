//
//  ContentView.swift
//  ActivityPractise
//
//  Created by Nitin Bhatia on 25/11/22.
//

import SwiftUI
import ActivityKit

struct ContentView: View {
    @State var activity : Activity<TimerAttributes>? = nil
    var body: some View {
        VStack {
            Button("Start Activity") {
                createActivity()
            }
            
            Button("End Activity") {
                endActivity()
            }
        }
        .padding()
    }
    
    func createActivity() {
        let attributes = TimerAttributes(timerName: "Timer Name")
        let state = TimerAttributes.ContentState(endTime: Date().addingTimeInterval(60 * 5))
        
        activity = try? Activity<TimerAttributes>.request(attributes: attributes, contentState: state)
    }
    
    func endActivity() {
        let endAttributes = TimerAttributes.ContentState(endTime: .now)
        Task {
            await activity?.end(using:endAttributes, dismissalPolicy: .immediate)
        }
    }
    
    func updateActivity() {
        let updateAttributes = TimerAttributes.ContentState(endTime: Date().addingTimeInterval(60*10))
        
        Task {
            await activity?.update(using:updateAttributes)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
