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
    weak var delegate: EventController?
    
    init(assignments: [Assignment] = []) {
        add(assignments)
    }
    
    func add(_ newAssignments: [Assignment]) {
        // put assignments in dictrionary by date
        for assignment in newAssignments {
            if assignments[assignment.date] == nil {
                assignments[assignment.date] = [assignment]
            } else {
                assignments[assignment.date]?.append(assignment)
            }
        }
        delegate?.add(newAssignments)
    }
    
    func remove(assignment: Assignment) {
        // remove assignment from list
        let date = assignment.date
        if assignments[date]?.count == 1 {
            assignments.removeValue(forKey: date)
        } else {
            if let index = assignments[date]?.firstIndex(of: assignment) {
                assignments[date]?.remove(at: index)
            }
        }
        delegate?.redo()
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
