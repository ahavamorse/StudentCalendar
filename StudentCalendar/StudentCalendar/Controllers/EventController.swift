//
//  EventController.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/22/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import Foundation

class EventController {
    
    var assignmentController: AssignmentController
    var classController: ClassController
    var assessmentController: AssessmentController
    
    private var events: [Date: [Event]] = [:]
    
    init(assignmentController: AssignmentController, classController: ClassController, assessmentController: AssessmentController) {
        self.assignmentController = assignmentController
        self.classController = classController
        self.assessmentController = assessmentController
        
        assignmentController.delegate = self
        classController.delegate = self
        assessmentController.delegate = self
        
        redo()
    }
    
    func redo() {
        events = [:]
        add(assignmentController.getAssignments())
        add(classController.getClasses())
        add(assessmentController.getAssessments())
    }
    
    func add(_ newEvents: [Event]) {
        // put assignments in dictrionary by date
        for event in newEvents {
            if events[event.date] == nil {
                events[event.date] = [event]
            } else {
                events[event.date]?.append(event)
            }
        }
    }
    
    func getEvents() -> [Event] {
        // return assignments in sorted order
        let sortedDates = events.keys.sorted()
        var sortedEvents: [Event] = []
        for key in sortedDates {
            sortedEvents += events[key] ?? []
        }
        return sortedEvents
    }
    
    func getEventsByDay() -> [[Event]] {
        var daysOfEvents: [[Event]] = []
        var currentDay = ""
        var currentIndex = -1
        for event in getEvents() {
            if event.dayString != currentDay {
                daysOfEvents.append([])
                currentIndex += 1
                currentDay = event.dayString
            }
            daysOfEvents[currentIndex].append(event)
        }
        return daysOfEvents
    }
}
