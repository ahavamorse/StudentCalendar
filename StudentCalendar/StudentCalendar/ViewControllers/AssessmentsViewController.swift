//
//  AssessmentsViewController.swift
//  StudentCalendar
//
//  Created by HapiDani on 8/5/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import UIKit

class AssessmentsViewController: UIViewController, EventsViewControllerProtocol {
    
    var tableView = UITableView()
    var assessmentController: AssessmentController!
    var subjectController: SubjectController!
    
    var assessments: [String: [Assessment]] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
