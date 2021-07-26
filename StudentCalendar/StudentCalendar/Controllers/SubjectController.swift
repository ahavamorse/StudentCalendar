//
//  SubjectController.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/23/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import Foundation

class SubjectController {
    
    var subjects: [String: Subject] = [:]
    let assignmentController: AssignmentController
    let classController: ClassController
    let assessmentController: AssessmentController
    
    init(subjects: [Subject] = [], assignmentController: AssignmentController, classController: ClassController, assessmentController: AssessmentController) {
        self.assignmentController = assignmentController
        self.classController = classController
        self.assessmentController = assessmentController
        self.add(subjects)
        
        assignmentController.subjectController = self
        classController.subjectController = self
        assessmentController.subjectController = self
    }
    
    func add(_ newSubjects: [Subject]) {
        for subject in newSubjects {
            subjects[subject.title] = subject
        }
    }
    
    func add(_ events: [Event]) {
        for event in events {
            subjects[event.subject.title]?.events.append(event)
        }
    }
    
    func remove(_ subject: Subject) {
        subjects.removeValue(forKey: subject.title)
        for event in subject.events {
            remove(event)
        }
    }
    
    func remove(_ event: Event) {
        if event.eventType == .assignment {
            assignmentController.remove(event)
        } else if event.eventType == .classPeriod {
            classController.remove(event)
        } else {
            assessmentController.remove(event)
        }
    }
}
