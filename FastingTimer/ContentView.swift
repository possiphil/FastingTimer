//
//  ContentView.swift
//  FastingTimer
//
//  Created by Philipp Sanktjohanser on 05.12.22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var fastingManager = FastingManager()
    @State private var selectedFastingPlan: FastingPlan = .intermediate
    
    var title: String {
        switch fastingManager.fastingState {
        case .notStarted:
            return "Let's get started!"
        case .fasting:
            return "You are now fasting"
        case .feeding:
            return "You are now feeding"
        }
    }
    
    var body: some View {
        ZStack {
            // MARK: Background
            Color(#colorLiteral(red: 0.05024140328, green: 0.006751002744, blue: 0.08163713664, alpha: 1))
                .ignoresSafeArea()
            
            content
        }
    }
    
    var content: some View {
        ZStack {
            VStack(spacing: 40) {
                // MARK: Title
                Text(title)
                    .font(.headline)
                    .foregroundColor(Color.blue)
                
                // MARK: Fasting Plan
                Picker("Choose your fasting plan", selection: $selectedFastingPlan) {
                    ForEach(FastingPlan.allCases, id: \.self) {
                        Text($0.localizedName)
                            .tag($0)
                    }
                }
                .fontWeight(.semibold)
                .padding(.horizontal, 24)
                .padding(.vertical, 8)
                .background(.thinMaterial)
                .cornerRadius(20)
                
                Spacer()
            }
            .padding()
            
            VStack(spacing: 40) {
                // MARK: Progress Ring
                ProgressRing()
                    .environmentObject(fastingManager)
                
                HStack(spacing: 60) {
                    // MARK: Start Time
                    VStack(spacing: 5) {
                        Text(fastingManager.fastingState == .notStarted ? "Start" : "Started")
                            .opacity(0.7)
                        
                        Text(fastingManager.startTime, format: .dateTime.weekday().hour().minute().second())
                            .bold()
                    }
                    
                    // MARK: End Time
                    VStack(spacing: 5) {
                        Text(fastingManager.fastingState == .notStarted ? "End" : "Ends")
                            .opacity(0.7)
                        
                        Text(fastingManager.endTime, format: .dateTime.weekday().hour().minute().second())
                            .bold()
                    }
                }
                // MARK: Button
                Button {
                    fastingManager.toggleFastingState()
                } label: {
                    Text(fastingManager.fastingState == .fasting ? "End fast" : "Start fasting")
                        .font(.title3.weight(.semibold))
                        .padding(.horizontal, 24)
                        .padding(.vertical, 8)
                        .background(.thinMaterial)
                        .cornerRadius(20)
                }
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
