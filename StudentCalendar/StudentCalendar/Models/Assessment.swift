//
//  Assessment.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/21/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import Foundation

struct Assessment: Event {
    var title: String
    var date: Date  // start time
    var endTime: Date?
    var subject: Subject
    var pointValue: Int
    var score: Int
    var notes: String
    var type: AssesmentType
}
