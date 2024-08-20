//
//  ClassesViewController.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/28/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import UIKit

class ClassesViewController: UIViewController {
    
    var tableView = UITableView()
    var classes: [[Class]] = []
    var classController: ClassController
    var subjectController: SubjectController
    
    init(classController: ClassController, subjectController: SubjectController) {
        self.classController = classController
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
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addClass))
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: nil)
    }
    
    private func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "Classes"
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        
        tableView.frame = view.bounds
        tableView.rowHeight = 85
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.removeExcessCells()
        
        tableView.register(ClassTableViewCell.self, forCellReuseIdentifier: ClassTableViewCell.reuseID)
    }
    
    private func updateUI() {
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
    
    @objc func addClass() {
        let addClassViewController = AddClassViewController(subjects: subjectController.getSubjects(), controller: classController)
        navigationController?.pushViewController(addClassViewController, animated: true)
    }
}

extension ClassesViewController: UITableViewDelegate, UITableViewDataSource {
    
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
