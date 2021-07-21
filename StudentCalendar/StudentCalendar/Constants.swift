//
//  Constants.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/21/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import UIKit

enum SubjectColor: String {
    case gray = "systemGray"
    case red = "systemRed"
    case orange = "systemOrange"
    case yellow = "systemYellow"
    case green = "systemGreen"
    case blue = "systemBlue"
    case purple = "systemPurple"
    case pink = "systemPink"
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
