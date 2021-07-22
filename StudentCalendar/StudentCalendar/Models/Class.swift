//
//  Class.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/21/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import Foundation

struct Class: Event, Equatable {
    var title: String
    var date: Date  // start time
    var endTime: Date
    var subject: Subject
    
    static func == (lhs: Class, rhs: Class) -> Bool {
        if lhs.title == rhs.title,
            lhs.date == rhs.date,
            lhs.endTime == rhs.endTime,
            lhs.subject.title == rhs.subject.title {
            return true
        } else {
            return false
        }
    }
}
