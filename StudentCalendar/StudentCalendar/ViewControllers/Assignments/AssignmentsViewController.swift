//
//  AssignmentsViewController.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/23/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import UIKit

class AssignmentsViewController: UIViewController {

    var tableView = UITableView()
    var notCompletedAssignments: [Assignment] = []
    var completedAssignments: [Assignment] = []
    var assignmentController: AssignmentController
    var subjectController: SubjectController
    
    init(assignmentController: AssignmentController, subjectController: SubjectController) {
        self.assignmentController = assignmentController
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
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAssignment))
    }
    
    private func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "Assignments"
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        
        tableView.frame = view.bounds
        tableView.rowHeight = 85
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.removeExcessCells()
        
        tableView.register(AssignmentTableViewCell.self, forCellReuseIdentifier: AssignmentTableViewCell.reuseID)
    }
    
    func updateUI() {
        (notCompletedAssignments, completedAssignments) = assignmentController.getSortedAssignments()
        if completedAssignments.isEmpty, notCompletedAssignments.isEmpty {
            // to do: show empty state
        } else {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.view.bringSubviewToFront(self.tableView)
            }
        }
    }
    
    @objc func addAssignment() {
        let addAssignmentViewController = AddAssignmentViewController(subjects: subjectController.getSubjects(), controller: assignmentController)
        navigationController?.pushViewController(addAssignmentViewController, animated: true)
    }
}

extension AssignmentsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Not Completed"
        default:
            return "Completed"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return notCompletedAssignments.count
        default:
            return completedAssignments.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AssignmentTableViewCell.reuseID) as! AssignmentTableViewCell
        
        switch indexPath.section {
        case 0:
            let assignment = notCompletedAssignments[indexPath.row]
            cell.set(assignment: assignment)
        default:
            let assignment = completedAssignments[indexPath.row]
            cell.set(assignment: assignment)
        }
        cell.delegate = self
        return cell
    }
}
