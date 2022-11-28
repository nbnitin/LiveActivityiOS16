//
//  ContentView.swift
//  ActivityDemo
//
//  Created by Nitin Bhatia on 23/11/22.
//

import SwiftUI
import ActivityKit

struct ContentView: View {
    @State var  activities = Activity<ActivityDemoAppAttributes>.activities

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("Create an activity to start a live activity")
                    Button(action: {
                        createActivity()
                        listAllDeliveries()
                    }) {
                        Text("Create Activity").font(.headline)
                    }.tint(.green)
                    Button(action: {
                        listAllDeliveries()
                    }) {
                        Text("List All Activities").font(.headline)
                    }.tint(.green)
                    Button(action: {
                        endAllActivity()
                        listAllDeliveries()
                    }) {
                        Text("End All Activites").font(.headline)
                    }.tint(.green)
                }
                Section {
                    if !activities.isEmpty {
                        Text("Live Activities")
                    }
                    activitiesView()
                }
            }
            .navigationTitle("Welcome!")
            .fontWeight(.ultraLight)
        }
        
    }
    
    func createActivity() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            
            if let error = error {
                // Handle the error here.
            }
            
            // Enable or disable features based on the authorization.
        }
        
        let attributes = ActivityDemoAppAttributes(numberOfGroceyItems: 12)
        let contentState = ActivityDemoAppAttributes.LiveDeliveryData(courierName: "Mike", deliveryTime: .now + 120)
        do {
            let _ = try Activity<ActivityDemoAppAttributes>.request(
                attributes: attributes,
                contentState: contentState)
        } catch (let error) {
            print(error.localizedDescription)
        }
    }
    func update(activity: Activity<ActivityDemoAppAttributes>) {
        Task {
            let updatedStatus = ActivityDemoAppAttributes.LiveDeliveryData(courierName: "Adam",
                                                                              deliveryTime: .now + 150)
            await activity.update(using: updatedStatus)
        }
    }
    
    func end(activity: Activity<ActivityDemoAppAttributes>) {
        Task {
            await activity.end(dismissalPolicy: .immediate)
        }
    }
    func endAllActivity() {
        Task {
            for activity in Activity<ActivityDemoAppAttributes>.activities{
                await activity.end(dismissalPolicy: .immediate)
            }
        }
    }
    func listAllDeliveries() {
        var activities = Activity<ActivityDemoAppAttributes>.activities
        activities.sort { $0.id > $1.id }
        self.activities = activities
    }
}

@available(iOS 16.1, *)
extension ContentView {
    
    func activitiesView() -> some View {
        var body: some View {
            ScrollView {
                ForEach(activities, id: \.id) { activity in
                    let courierName = activity.contentState.courierName
                    let deliveryTime = activity.contentState.deliveryTime
                    HStack(alignment: .center) {
                        Text(courierName)
                        Text(deliveryTime, style: .timer)
                        Text("update")
                            .font(.headline)
                            .foregroundColor(.green)
                            .onTapGesture {
                                update(activity: activity)
                                listAllDeliveries()
                            }
                        Text("end")
                            .font(.headline)
                            .foregroundColor(.green)
                            .onTapGesture {
                                end(activity: activity)
                                listAllDeliveries()
                            }
                    }
                }
            }
        }
        return body
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
