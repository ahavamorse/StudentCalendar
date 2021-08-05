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
    }

    private func configureNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addSubject))
    }
    
    @objc func addSubject() {
        
    }
}
