//
//  Assignment.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/21/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import Foundation

struct Assignment: Event {
    var title: String
    var date: Date  // due date
    var subject: Subject
    var type: AssignmentType
    var pointValue: Int
    var score: Int
    var instructions: String
    var status: AssignmentStatus
}
