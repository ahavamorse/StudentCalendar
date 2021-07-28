//
//  EventsViewController.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/28/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import UIKit

protocol EventsViewController {
    
    var tableView: UITableView { get set }
    var subjectController: SubjectController { get set }
    var addEventViewController: AddEventViewController { get set }

    func viewDidLoad()
    func configureNavigationBar()
    func configureViewController()
    func configureTableView()
    func updateUI()
}
