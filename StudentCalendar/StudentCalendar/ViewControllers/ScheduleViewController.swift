//
//  ScheduleViewController.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/21/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import UIKit

class ScheduleViewController: UIViewController {
    
    let tableView = UITableView()
    var events: [Event] = []
    
    override func viewDidLoad() {
        events = [Assignment(title: "Homework", date: Date(), subject: Subject(title: "Math", instructor: "Math Teacher", startDate: Date(), endDate: Date(), colorName: "Blue", color: .blue), type: .homework, pointValue: 10, instructions: "Finish promblems 1-10", status: .inProgress)]
        
        super.viewDidLoad()
        configureViewController()
        configureTableView()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "Calendar"
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
        tableView.frame = view.bounds
        tableView.rowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
        tableView.removeExcessCells()
        
        tableView.register(EventTableViewCell.self, forCellReuseIdentifier: EventTableViewCell.reuseID)
    }
    
    func updateUI() {
        if events.isEmpty {
            // todo: show empty state
        } else {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.view.bringSubviewToFront(self.tableView)
            }
        }
    }
}

extension ScheduleViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
        // TODO: sort events by day then create sections for each day and rows for each event that day
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EventTableViewCell.reuseID) as! EventTableViewCell
        let event = events[indexPath.row] // TODO
        cell.set(event: event)
        return cell
    }
}
