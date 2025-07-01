//
//  Int+Extensions.swift
//  PodcastDemo
//
//  Created by Nawaf  on 01/07/2025.
//

import Foundation

extension Int {
    var toHoursAndMinutes: String {
        let hours = self / 60
        let minutes = self % 60
        
        if hours == 0 {
            return "\(minutes) min"
        } else if minutes == 0 {
            return "\(hours) h"
        } else {
            return "\(hours)h \(minutes)m"
        }
    }
}
