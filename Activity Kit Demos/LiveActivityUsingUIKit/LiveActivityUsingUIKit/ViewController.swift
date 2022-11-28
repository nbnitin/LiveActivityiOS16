//
//  ViewController.swift
//  LiveActivityUsingUIKit
//
//  Created by Nitin Bhatia on 28/11/22.
//

import UIKit
import ActivityKit

class ViewController: UIViewController {
    var activity : Activity<LiveActivityAttributes>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func createActivityAction(_ sender: Any) {
        createActivity()
    }
    
    @objc func createActivity() {
        do {
            activity = try Activity.request(
                attributes: LiveActivityAttributes(name: "Hello Activity"),
                contentState: .init(
                    updateTime : .now + 120
                )
            )
        } catch (let error) {
            print(error)
        }
    }
    
    
}

