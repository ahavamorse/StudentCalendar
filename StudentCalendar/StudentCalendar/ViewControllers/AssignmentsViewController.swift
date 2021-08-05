//
//  AssignmentsViewController.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/23/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import UIKit

class AssignmentsViewController: UIViewController, EventsViewControllerProtocol {

    var tableView = UITableView()
    var assignmentController: AssignmentController!
    var subjectController: SubjectController!
    
    var notCompletedAssignments: [Assignment] = []
    var completedAssignments: [Assignment] = []
    
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
    
    internal func configureNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAssignment))
    }
    
    internal func configureViewController() {
        view.backgroundColor = .systemBackground
    }
    
    internal func configureTableView() {
        view.addSubview(tableView)
        
        tableView.frame = view.bounds
        tableView.rowHeight = 85
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.removeExcessCells()
        
        tableView.register(AssignmentTableViewCell.self, forCellReuseIdentifier: AssignmentTableViewCell.reuseID)
    }
    
    @objc func addAssignment() {
        let addAssignmentViewController = AddEventViewController(title: "New Assignment", dateLabelText: "Due Date:", type: .assignment)
        addAssignmentViewController.delegate = self
        for subject in subjectController.subjects.values {
            addAssignmentViewController.subjects.append(subject)
        }
        navigationController?.pushViewController(addAssignmentViewController, animated: true)
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
}

extension AssignmentsViewController {
    
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
