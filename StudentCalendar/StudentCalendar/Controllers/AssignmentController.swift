//
//  AssignmentController.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/22/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import Foundation

class AssignmentController {
    
    private var allAssignments: [Assignment]
    private var assignments: [Date: [Assignment]] = [:]
    
    init(assignments: [Assignment] = []) {
        self.allAssignments = assignments
        self.sortAssignments()
    }
    
    private func sortAssignments() {
        // todo put assignments in order by date starting with soonest
    }
    
    func add(assignment: Assignment) {
        // put new assignment in the correct spot
    }
    
    func remove(assignment: Assignment) {
        // remove assignment from list
    }
    
    func getAssignments() {
        // return assignments in sorted order
    }
    
}
