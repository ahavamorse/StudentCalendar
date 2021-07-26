//
//  AddEventViewController.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/26/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import UIKit

class AddEventViewController: UIViewController {
    
    let eventTypeSegmentedControl = UISegmentedControl(items: ["Assignment", "Class Period", "Assessment"])
    let titleTextField = UITextField()
    let subjectLabel = TitleLabel(font: .preferredFont(forTextStyle: .title2))
    let subjectPickerView = UIPickerView()
    let dateLabel = TitleLabel(font: .preferredFont(forTextStyle: .title2))
    let datePickerView = UIDatePicker()
    
    var eventType: EventType {
        get {
            if eventTypeSegmentedControl.tag == 0 {
                return .assignment
            } else if eventTypeSegmentedControl.tag == 1 {
                return .classPeriod
            } else {
                return .assessment
            }
        }
    }
    
    var assignmentController: AssignmentController?
    var classController: ClassController?
    var assessmentController: AssessmentController?
    var subjects: [Subject] = []

}
