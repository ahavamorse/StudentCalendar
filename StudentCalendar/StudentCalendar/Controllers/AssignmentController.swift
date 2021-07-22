//
//  AssignmentController.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/22/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import Foundation

class AssignmentController {
    
    private var assignments: [Date: [Assignment]] = [:]
    
    init(assignments: [Assignment] = []) {
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
        sortAssignments([assignment])
    }
    
    func remove(assignment: Assignment) {
        // remove assignment from list
        
    }
    
    func getAssignments() -> [Assignment] {
        // return assignments in sorted order
        let sortedDates = assignments.keys.sorted()
        var sortedAssignments: [Assignment] = []
        for key in sortedDates {
            sortedAssignments += assignments[key] ?? []
        }
        return sortedAssignments
    }
    
}
