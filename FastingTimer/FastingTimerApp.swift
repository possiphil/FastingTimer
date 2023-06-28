//
//  FastingTimerApp.swift
//  FastingTimer
//
//  Created by Philipp Sanktjohanser on 05.12.22.
//
// https://www.youtube.com/watch?v=pdYTtbOl9YQ
//
// MARK: 1. Turn Fasting Plan UI into a button that lets the user change the plan
// MARK: 2. Add edit icon to let user change start time
// MARK: 3. Record all start and end times into a list to let the user know their history

import SwiftUI

@main
struct FastingTimerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(FastingManager())
        }
    }
}
