//
//  ClassController.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/22/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import Foundation

class ClassController {
    
    private var classes: [Date: [Class]] = [:]
    var delegate: EventController?
    var subjectController: SubjectController?
    
    init(classes: [Class] = []) {
        add(classes)
    }
    
    func add(_ newClasses: [Class]) {
        // put classes in dictrionary by date
        for newClass in newClasses {
            if classes[newClass.date] == nil {
                classes[newClass.date] = [newClass]
            } else {
                classes[newClass.date]?.append(newClass)
            }
        }
        delegate?.add(newClasses)
        subjectController?.add(newClasses)
    }
    
    func remove(_ oldClass: Class) {
        // remove class from list
        let date = oldClass.date
        if classes[date]?.count == 1 {
            classes.removeValue(forKey: date)
        } else {
            if let index = classes[date]?.firstIndex(of: oldClass) {
                classes[date]?.remove(at: index)
            }
        }
        delegate?.redo()
        subjectController?.remove(oldClass)
    }
    
    func remove(_ event: Event) {
        if let classes = self.classes[event.date] {
            for index in 0...classes.count {
                if compare(currentClass: classes[index], event: event) {
                    self.classes[event.date]?.remove(at: index)
                    return
                }
            }
        }
    }
    
    func compare(currentClass: Class, event: Event) -> Bool {
        if currentClass.date == event.date,
            currentClass.title == event.title,
            currentClass.subject.title == event.subject.title {
            return true
        } else {
            return false
        }
    }
    
    func getClasses() -> [Class] {
        // return classes in sorted order
        let sortedDates = classes.keys.sorted()
        var sortedClasses: [Class] = []
        for key in sortedDates {
            sortedClasses += classes[key] ?? []
        }
        return sortedClasses
    }
}
