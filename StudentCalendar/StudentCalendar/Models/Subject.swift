//
//  Subject.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/21/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import UIKit

struct Subject {
    var title: String
//    var instructor: String
//    var startDate: Date
//    var endDate: Date
    var events: [Event] = []
    var colorName: String
    var color: UIColor { SubjectColor.colors[colorName]! }
}
