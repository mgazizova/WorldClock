//
//  ContentView.swift
//  WorldClock
//
//  Created by Мария Газизова on 21.10.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var timeZones: [String] = ["GMT", "Europe/Moscow"]
    @State private var isPresented = false
    
    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List(timeZones, id: \.self) { timeZone in
                Text(time(for: timeZone))
            }
            
            NavigationLink("Add new time") {
                List(TimeZone.knownTimeZoneIdentifiers, id: \.self) { timezone in
                    Button(timezone) {
                        timeZones.append(timezone)
                    }
                }
                .navigationTitle("Add new time")
            }
            .navigationTitle("World clock")
        }
    }
    
    func time(for timeZoneId: String) -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        
        dateFormatter.timeZone = TimeZone(identifier: timeZoneId) ?? .current
        
        return dateFormatter.string(from: Date.now)
    }
}

#Preview {
    ContentView()
}
