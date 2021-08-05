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
    var subjects: [Subject] = []

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureViewController()
        configureTableView()
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAssessment))
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: nil)
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
    
    func updateUI() {
        getAssessments()
        if assessments.isEmpty {
            // to do: show empty state
        } else {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.view.bringSubviewToFront(self.tableView)
            }
        }
    }
    
    func getAssessments() {
        // to do: set subjects and assessments
    }
}

extension AssessmentsViewController {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return assessments.keys.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return subjects[section].title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return assessments[subjects[section].title]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AssessmentTableViewCell.reuseID) as! AssessmentTableViewCell
        let assessment = assessments[subjects[indexPath.section].title]![indexPath.row]
        cell.set(assessment: assessment)
        cell.delegate = self
        return cell
    }
}
