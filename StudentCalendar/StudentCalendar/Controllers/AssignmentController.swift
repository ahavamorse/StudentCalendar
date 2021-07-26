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
    var delegate: EventController?
    var subjectController: SubjectController?
    
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
        subjectController?.add(newAssignments)
    }
    
    func remove(_ oldAssignment: Assignment) {
        // remove assignment from list
        let date = oldAssignment.date
        if assignments[date]?.count == 1 {
            assignments.removeValue(forKey: date)
        } else {
            if let index = assignments[date]?.firstIndex(of: oldAssignment) {
                assignments[date]?.remove(at: index)
            }
        }
        delegate?.redo()
        subjectController?.remove(oldAssignment)
    }
    
    func remove(_ event: Event) {
        if let assignments = self.assignments[event.date] {
            for index in 0...assignments.count {
                if compare(assignment: assignments[index], event: event) {
                    self.assignments[event.date]?.remove(at: index)
                    return
                }
            }
        }
    }
    
    func compare(assignment: Assignment, event: Event) -> Bool {
        if assignment.date == event.date,
            assignment.title == event.title,
            assignment.subject.title == event.subject.title {
            return true
        } else {
            return false
        }
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
