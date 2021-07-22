//
//  Assessment.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/21/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import Foundation

struct Assessment: Event, Equatable {
    var title: String
    var date: Date  // start time
    var endTime: Date?
    var subject: Subject
    var pointValue: Int
    var score: Int
    var notes: String
    var type: AssesmentType
    
    static func == (lhs: Assessment, rhs: Assessment) -> Bool {
        if lhs.title == rhs.title,
            lhs.date == rhs.date,
            lhs.endTime == rhs.endTime,
            lhs.subject.title == rhs.subject.title,
            lhs.type == rhs.type,
            lhs.pointValue == rhs.pointValue {
            return true
        } else {
            return false
        }
    }
}
