//
//  SubjectsViewController.swift
//  StudentCalendar
//
//  Created by HapiDani on 8/5/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import UIKit

class SubjectsViewController: UIViewController {
    
    var tableView = UITableView()
    var subjectController: SubjectController!
    var subjects: [Subject] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateUI()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureViewController()
        subjects = subjectController.getSubjects()
        configureTableView()
    }

    private func configureNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addSubject))
    }
    
    private func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "Subjects"
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        
        tableView.frame = view.bounds
        tableView.rowHeight = 60
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.removeExcessCells()
        
        tableView.register(SubjectTableViewCell.self, forCellReuseIdentifier: SubjectTableViewCell.reuseID)
    }
    
    @objc func addSubject() {
        let addSubjectViewController = AddSubjectViewController(title: "New Subject", subjectController: subjectController)
        navigationController?.pushViewController(addSubjectViewController, animated: true)
    }
    
    func updateUI() {
        subjects = subjectController.getSubjects()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension SubjectsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SubjectTableViewCell.reuseID) as! SubjectTableViewCell
        let subject = subjects[indexPath.row]
        cell.set(subject: subject)
        return cell
    }
}
