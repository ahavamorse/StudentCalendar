//
//  EventsViewController.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/28/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController {
    
    let tableView = UITableView()
    var subjectController: SubjectController!
    var addEventViewController: AddEventViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureViewController()
        configureTableView()
        updateUI()
    }
    
    private func configureNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configureViewController() {
        view.backgroundColor = .systemBackground
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.removeExcessCells()
    }
}
