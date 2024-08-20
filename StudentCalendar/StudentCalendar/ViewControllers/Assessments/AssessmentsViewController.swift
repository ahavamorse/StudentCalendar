//
//  AssessmentsViewController.swift
//  StudentCalendar
//
//  Created by HapiDani on 8/5/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import UIKit

class AssessmentsViewController: UIViewController {
    
    var tableView = UITableView()
    var assessments: [String: [Assessment]] = [:]
    var subjects: [Subject] = []
    var assessmentController: AssessmentController
    var subjectController: SubjectController
    
    init(assessmentController: AssessmentController, subjectController: SubjectController) {
        self.assessmentController = assessmentController
        self.subjectController = subjectController
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureViewController()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAssessment))
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "Assessments"
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
        tableView.frame = view.bounds
        tableView.rowHeight = 85
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.removeExcessCells()
        
        tableView.register(AssessmentTableViewCell.self, forCellReuseIdentifier: AssessmentTableViewCell.reuseID)
    }
    
    private func updateUI() {
        (subjects, assessments) = assessmentController.getSortedAssessments()
        if assessments.isEmpty {
            // to do: show empty state
        } else {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.view.bringSubviewToFront(self.tableView)
            }
        }
    }
    
    @objc func addAssessment() {
        let addAssessmentViewController = AddAssessmentViewController(subjects: subjectController.getSubjects(), controller: assessmentController)
        navigationController?.pushViewController(addAssessmentViewController, animated: true)
    }
}

extension AssessmentsViewController: UITableViewDelegate, UITableViewDataSource {
    
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
