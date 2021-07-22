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
        self.sortAssignments(assignments)
    }
    
    private func sortAssignments(_ newAssignments: [Assignment]) {
        // todo put assignments in dictrionary by date
        for assignment in newAssignments {
            if assignments[assignment.date] == nil {
                assignments[assignment.date] = [assignment]
            } else {
                assignments[assignment.date]?.append(assignment)
            }
        }
    }
    
    func add(assignment: Assignment) {
        // put new assignment in the correct spot
        allAssignments.append(assignment)
        sortAssignments([assignment])
    }
    
    func remove(assignment: Assignment) {
        // remove assignment from list
    }
    
    func getAssignments() {
        // return assignments in sorted order
    }
    
}
