//
//  NewTimeViewModel.swift
//  WorldClock
//
//  Created by Мария Газизова on 12.11.2024.
//

import Foundation

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
