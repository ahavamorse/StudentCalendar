//
//  AssignmentsViewController.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/23/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import UIKit

class AssignmentsViewController: UIViewController {

    let tableView = UITableView()
    var assignmentController: AssignmentController!
    var assignments: [Assignment] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureViewController()
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAssignment))
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
    }
    
    @objc func addAssignment() {
        
    }
}
