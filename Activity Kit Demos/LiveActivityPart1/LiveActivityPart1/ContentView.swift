//
//  ContentView.swift
//  LiveActivityPart1
//
//  Created by Nitin Bhatia on 23/11/22.
//

import SwiftUI
import ActivityKit

struct ContentView: View {
    @State var activity : Activity<LiveActivityPart1WidgetAttributes>!
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .onAppear() {
            createActivity()
            
           
            
        }.onReceive(timer, perform: {input in
           // self.update(activity: activity)
        })
    }
    
    func createActivity() {
        do {
            activity = try Activity.request(
                attributes: LiveActivityPart1WidgetAttributes(name: "Hello Activity"),
                contentState: .init(
                    value: 0, dd: .now + 120
                )
            )
        } catch (let error) {
            print(error)
        }
    }
    
    func update(activity: Activity<LiveActivityPart1WidgetAttributes>) {
        Task {
            let oldValue = activity.contentState.value
            await activity.update(using: .init(value: oldValue + 1,dd: .now + 10))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
