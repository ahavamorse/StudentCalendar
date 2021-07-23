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
    var subject: Subject
//    var pointValue: Int
//    var score: Int?
//    var notes: String
//    var type: AssesmentType
    
    var date: Date  // start time
//    var endDate: Date?
    var dayString: String { get { return date.convertToDayMonthDayFormat() } }
    var timeString: String { get { return date.convertToHourMinuteFormat() } }
//    var endTimeString: String? { get { return endDate?.convertToHourMinuteFormat() } }
    
    static func == (lhs: Assessment, rhs: Assessment) -> Bool {
        if lhs.title == rhs.title,
            lhs.date == rhs.date,
//            lhs.endDate == rhs.endDate,
            lhs.subject.title == rhs.subject.title {
//            lhs.type == rhs.type,
//            lhs.pointValue == rhs.pointValue {
            return true
        } else {
            return false
        }
    }
}
