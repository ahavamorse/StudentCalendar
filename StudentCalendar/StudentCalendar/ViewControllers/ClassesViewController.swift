//
//  ClassesViewController.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/28/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import UIKit

class ClassesViewController: UIViewController {
    
    let tableView = UITableView()
    var classController: ClassController!
    var subjectController: SubjectController!
    var addEventViewController: AddEventViewController?
    var classes: [Class] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureViewController()
        configureTableView()
        classes = classController.getClasses()
        updateUI()
    }
    
    private func configureNavigationBar() {
        
    }
    
    private func configureViewController() {
        
    }
    
    private func configureTableView() {
        
    }
}
