//
//  ClassesViewController.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/28/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import UIKit

class ClassesViewController: UIViewController, EventsViewControllerProtocol {
    
    var tableView = UITableView()
    var classController: ClassController!
    var subjectController: SubjectController!
    
    var classes: [[Class]] = []
    
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
        let addClassViewController = AddEventViewController(title: "New Class Period", type: .classPeriod)
        addClassViewController.delegate = self
        for subject in subjectController.subjects.values {
            addClassViewController.subjects.append(subject)
        }
        navigationController?.pushViewController(addClassViewController, animated: true)
    }
    
    func updateUI() {
        classes = classController.getClassesByDay()
        if classes.isEmpty {
            // to do: show empty state
        } else {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.view.bringSubviewToFront(self.tableView)
            }
        }
    }
}

extension ClassesViewController {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return classes.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return classes[section][0].dayString
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classes[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ClassTableViewCell.reuseID) as! ClassTableViewCell
        let currentClass = classes[indexPath.section][indexPath.row]
        cell.set(cellClass: currentClass)
        cell.delegate = self
        return cell
    }
}
