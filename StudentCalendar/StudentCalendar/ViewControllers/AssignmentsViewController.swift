//
//  AssignmentsViewController.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/23/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import UIKit

class AssignmentsViewController: UIViewController, EventsViewController {

    var tableView = UITableView()
    var assignmentController: AssignmentController!
    var subjectController: SubjectController!
    var addEventViewController: AddEventViewController!
    var assignments: [Assignment] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureViewController()
        configureTableView()
        assignments = assignmentController.getAssignments()
        updateUI()
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
        addEventViewController.eventTypeSegmentedControl.selectedSegmentIndex = 0
        addEventViewController.modalPresentationStyle = .fullScreen
        addEventViewController.title = "New Assignment"
        
        for subject in subjectController.subjects.values {
            addEventViewController.subjects.append(subject)
        }
        
        present(addEventViewController, animated: true)
    }
    
    func updateUI() {
        if assignments.isEmpty {
            // todo: show empty state
        } else {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.view.bringSubviewToFront(self.tableView)
            }
        }
    }
}

extension AssignmentsViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return assignments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AssignmentTableViewCell.reuseID) as! AssignmentTableViewCell
        let assignment = assignments[indexPath.row]
        cell.set(assignment: assignment)
        cell.delegate = self
        return cell
    }
}
