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
        configureNavigationBar()
        configureViewController()
        configureTableView()
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAssessment))
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
        tableView.frame = view.bounds
        tableView.rowHeight = 80 // might change
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.removeExcessCells()
        
        tableView.register(AssessmentTableViewCell.self, forCellReuseIdentifier: AssessmentTableViewCell.reuseID)
    }
    
    @objc func addAssessment() {
        let addAssessmentViewController = AddEventViewController(title: "New Assessment", type: .assessment)
        addAssessmentViewController.delegate = self
        for subject in subjectController.subjects.values {
            addAssessmentViewController.subjects.append(subject)
        }
        navigationController?.pushViewController(addAssessmentViewController, animated: true)
    }
}
