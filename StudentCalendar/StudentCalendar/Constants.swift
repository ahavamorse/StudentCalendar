//
//  Constants.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/21/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import UIKit

enum SubjectColor {
    static let names = ["gray", "red", "orange", "yellow", "green", "blue", "purple", "pink"]
    
    static let gray = UIColor.systemGray
    static let red = UIColor.systemRed
    static let orange = UIColor.systemOrange
    static let yellow = UIColor.systemYellow
    static let green = UIColor.systemGreen
    static let blue = UIColor.systemBlue
    static let purple = UIColor.systemPurple
    static let pink = UIColor.systemPink
}

enum AssignmentType {
    case homework
    case project
    case review
    case other
}

enum AssignmentStatus {
    case unavailable
    case available
    case assigned
    
    case notStarted
    case inProgress
    case completed
    case doubleChecked
    case submitted
    case graded
    
    case pastDue
    case submittedLate
}

enum AssesmentType {
    case quiz
    case chapterTest
    case midtermExam
    case finalExam
    case other
}
