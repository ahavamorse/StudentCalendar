//
//  ScheduleViewController.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/21/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController, EventsViewControllerProtocol {
    
    var tableView = UITableView()
    var eventController: EventController!
    var subjectController: SubjectController!
    var eventsByDay: [[Event]] = []
    
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
    
    func configureNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Subjects", style: .plain, target: self, action: #selector(showSubjects))
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
        tableView.frame = view.bounds
        tableView.rowHeight = 60
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.removeExcessCells()
        
        tableView.register(EventTableViewCell.self, forCellReuseIdentifier: EventTableViewCell.reuseID)
    }
    
    @objc func showSubjects() {
        // to do
    }
    
    func updateUI() {
        eventsByDay = eventController.getEventsByDay()
        if eventsByDay.isEmpty {
            // to do: show empty state
        } else {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.view.bringSubviewToFront(self.tableView)
            }
        }
    }
}

extension ScheduleViewController {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return eventsByDay.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return eventsByDay[section][0].dayString
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventsByDay[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EventTableViewCell.reuseID) as! EventTableViewCell
        let event = eventsByDay[indexPath.section][indexPath.row]
        cell.set(event: event)
        return cell
    }
}
