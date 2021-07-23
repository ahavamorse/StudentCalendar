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
    
    init(subjects: [Subject] = []) {
        add(subjects)
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
    
//    func remove(_ subject: Subject) {
//        subjects.removeValue(forKey: subject.title)
//        // todo: remove all events of the subject
//    }
    
    func remove(_ event: Event) {
        // todo remove event from subject's array of events
    }
}
