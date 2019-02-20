//
//  Date.swift
//  PrettyDate
//
//  Created by 1 on 20/02/2019.
//  Copyright © 2019 Sung hyun. All rights reserved.
//

import Foundation

extension Date {
    func offsetString() -> String {
        if years() > 0 { return "\(years())" + "TIME_AGO_YEAR".localized() }
        if months() > 0 { return "\(months())" + "TIME_AGO_MONTH".localized() }
        if weeks() > 0 { return "\(weeks())" + "TIME_AGO_WEEK".localized() }
        if days() > 0 { return "\(days())" + "TIME_AGO_DAY".localized() }
        if hours() > 0 { return "\(hours())" + "TIME_AGO_HOUR".localized() }
        if minutes() > 0 { return "\(minutes())" + "TIME_AGO_MINUTE".localized() }
        if seconds() > 0 { return "TIME_AGO_NOW".localized() }
        return ""
    }
    
    func years() -> Int {
        return Calendar.current.dateComponents([.year], from: self, to: Date()).year ?? 0
    }
    
    func months() -> Int {
        return Calendar.current.dateComponents([.month], from: self, to: Date()).month ?? 0
    }
    
    func weeks() -> Int {
        return Calendar.current.dateComponents([.weekOfYear], from: self, to: Date()).weekOfYear ?? 0
    }
    
    func days() -> Int {
        return Calendar.current.dateComponents([.day], from: self, to: Date()).day ?? 0
    }
    
    func hours() -> Int {
        return Calendar.current.dateComponents([.hour], from: self, to: Date()).hour ?? 0
    }
    
    func minutes() -> Int {
        return Calendar.current.dateComponents([.minute], from: self, to: Date()).minute ?? 0
    }
    
    func seconds() -> Int {
        return Calendar.current.dateComponents([.second], from: self, to: Date()).second ?? 0
    }
}
