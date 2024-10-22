//
//  ViewModel.swift
//  WorldClock
//
//  Created by Мария Газизова on 22.10.2024.
//

import SwiftUI

extension ContentView {
    class ViewModel: ObservableObject {
        @Published private(set) var timeZones = ["GMT", "Europe/Moscow"]
        
        func time(for timeZoneId: String) -> String {
            let dateFormatter = DateFormatter()
            
            dateFormatter.dateStyle = .none
            dateFormatter.timeStyle = .short
            
            dateFormatter.timeZone = TimeZone(identifier: timeZoneId) ?? .current
            
            return dateFormatter.string(from: Date.now)
        }
        
        func addTimeZone(_ timeZone: String) {
            timeZones.append(timeZone)
        }
    }
}

extension NewTimeView {
    @Observable
    class ViewModel {
        var searchText = ""
        
        var searchResults: [String] {
            if searchText.isEmpty {
                return TimeZone.knownTimeZoneIdentifiers
            } else {
                return TimeZone.knownTimeZoneIdentifiers.filter { $0.contains(searchText)}
            }
        }
    }
}
