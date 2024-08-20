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
    var subjects: [Subject] = []
    var subjectController: SubjectController
    
    init(subjectController: SubjectController) {
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
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addSubject))
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: nil)
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
    
    private func updateUI() {
        subjects = subjectController.getSubjects()
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    @objc func addSubject() {
        let addSubjectViewController = AddSubjectViewController(subjectController: subjectController)
        navigationController?.pushViewController(addSubjectViewController, animated: true)
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
