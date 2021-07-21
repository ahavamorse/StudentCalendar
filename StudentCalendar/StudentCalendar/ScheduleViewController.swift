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
        super.viewDidLoad()
        configureViewController()
        configureTableView()
    }
    
    func configureViewController() {
        view.backgroundColor = .systemBackground
        title = "Calendar"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
        tableView.frame = view.bounds
        tableView.rowHeight = 80
        tableView.delegate = self
        tableView.dataSource = self
        tableView.removeExcessCells()
        
        tableView.register(EventCell.self, forCellReuseIdentifier: EventCell.reuseID)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: EventCell.reuseID) as! EventCell
        let event = events[indexPath.row] // TODO
        cell.set(event: event)
        return cell
    }
}
