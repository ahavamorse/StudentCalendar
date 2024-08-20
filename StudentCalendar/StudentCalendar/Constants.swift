//
//  Constants.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/21/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import UIKit

enum SubjectColor {
    static let colors: [String: UIColor] =
        [ "Gray" : UIColor.systemGray,
          "Red": UIColor.systemRed,
          "Orange": UIColor.systemOrange,
          "Yellow": UIColor.systemYellow,
          "Green": UIColor.systemGreen,
          "Blue": UIColor.systemBlue,
          "Purple": UIColor.systemPurple,
          "Pink": UIColor.systemPink ]
}

enum TabBarItem {
    static let schedule = UITabBarItem(title: "Schedule", image: UIImage(systemName: "calendar"), tag: 0)
    static let assignments = UITabBarItem(title: "Assignments", image: UIImage(systemName: "list.bullet"), tag: 1)
    static let classes = UITabBarItem(title: "Classes", image: UIImage(systemName: "clock"), tag: 2)
    static let assessments = UITabBarItem(title: "Assessments", image: UIImage(systemName: "book"), tag: 3)
}

enum CheckboxImage {
    static let checked = UIImage(named: "checked")
    static let unchecked = UIImage(named: "unchecked")
}

enum EventType {
    case assignment
    case classPeriod
    case assessment
}

//enum AssignmentType {
//    case homework
//    case project
//    case review
//    case other
//}

enum AssignmentStatus {
//    case unavailable
//    case available
//    case assigned
    
    case notStarted
//    case inProgress
    case completed
//    case doubleChecked
//    case submitted
//    case graded
    
//    case pastDue
//    case submittedLate
}

//enum AssesmentType {
//    case quiz
//    case chapterTest
//    case midtermExam
//    case finalExam
//    case other
//}
