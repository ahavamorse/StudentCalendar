//
//  ClassesViewController.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/28/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import UIKit

class ClassesViewController: UIViewController, EventsViewControllerProtocol {
    
    let tableView = UITableView()
    var classController: ClassController!
    var subjectController: SubjectController!
    var addEventViewController: AddEventViewController!
    var classes: [Class] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureViewController()
        configureTableView()
        classes = classController.getClasses()
        updateUI()
    }
    
    internal func configureNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addClass))
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
        
        tableView.register(ClassTableViewCell.self, forCellReuseIdentifier: ClassTableViewCell.reuseID)
    }
    
    @objc func addClass() {
        addEventViewController.eventTypeSegmentedControl.selectedSegmentIndex = 1
        addEventViewController.modalPresentationStyle = .fullScreen
        addEventViewController.title = "New Class"
        
        for subject in subjectController.subjects.values {
            addEventViewController.subjects.append(subject)
        }
        
        present(addEventViewController, animated: true)
    }
    
    func updateUI() {
        if classes.isEmpty {
            // todo: show empty state
        } else {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.view.bringSubviewToFront(self.tableView)
            }
        }
    }
}

extension ClassesViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ClassTableViewCell.reuseID) as! ClassTableViewCell
        let currentClass = classes[indexPath.row]
        cell.set(currentClass)
        cell.delegate = self
        return cell
    }
}
