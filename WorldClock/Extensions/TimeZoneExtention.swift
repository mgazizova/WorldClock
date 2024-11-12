//
//  TimeZoneExtention.swift
//  WorldClock
//
//  Created by Мария Газизова on 12.11.2024.
//

import Foundation

extension TimeZone {
    var prettyDescription: String {
        let localizedName = self.localizedName(for: .standard, locale: nil) ?? ""
        return "\(self.identifier) (\(localizedName))"
    }
}
