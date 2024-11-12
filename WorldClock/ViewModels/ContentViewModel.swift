//
//  ViewModel.swift
//  WorldClock
//
//  Created by Мария Газизова on 22.10.2024.
//

import SwiftUI

extension ContentView {
    class ViewModel: ObservableObject {
        @Published private(set) var timeZonesNotString: [TimeZone] = [.gmt, .current]
        
        func time(for timeZoneId: String) -> String {
            let dateFormatter = DateFormatter()
            
            dateFormatter.dateStyle = .none
            dateFormatter.timeStyle = .short
            
            dateFormatter.timeZone = TimeZone(identifier: timeZoneId) ?? .current
            
            return dateFormatter.string(from: Date.now)
        }
        
        func addTimeZoneNotString(_ timeZone: String) {
            if let zone = TimeZone(identifier: timeZone) {
                timeZonesNotString.append(zone)
            }
        }
        
        func deleteTimeZoneNotString(at offsets: IndexSet) {
            timeZonesNotString.remove(atOffsets: offsets)
        }
    }
}
