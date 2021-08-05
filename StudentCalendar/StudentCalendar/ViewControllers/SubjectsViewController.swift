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

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureViewController()
        configureTableView()
    }

    private func configureNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addSubject))
    }
    
    private func configureViewController() {
        view.backgroundColor = .systemBackground
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
        
    }
}
