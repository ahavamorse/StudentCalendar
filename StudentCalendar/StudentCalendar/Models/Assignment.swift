//
//  Assignment.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/21/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import Foundation

struct Assignment: Event, Equatable {
    var title: String
    var date: Date  // due date
    var subject: Subject
    var type: AssignmentType
    var pointValue: Int
    var score: Int?
    var instructions: String
    var status: AssignmentStatus
    
    static func == (lhs: Assignment, rhs: Assignment) -> Bool {
        if lhs.title == rhs.title,
            lhs.date == rhs.date,
            lhs.subject.title == rhs.subject.title,
            lhs.type == rhs.type,
            lhs.pointValue == rhs.pointValue,
            lhs.status == rhs.status {
            return true
        } else {
            return false
        }
    }
}
