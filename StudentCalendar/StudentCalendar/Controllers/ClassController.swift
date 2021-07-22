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
    
    init(classes: [Class] = []) {
        add(classes)
    }
    
    func add(_ newClasses: [Class]) {
        // put assignments in dictrionary by date
        for newClass in newClasses {
            if classes[newClass.date] == nil {
                classes[newClass.date] = [newClass]
            } else {
                classes[newClass.date]?.append(newClass)
            }
        }
    }
    
    func remove(_ oldClass: Class) {
        // remove assignment from list
        let date = oldClass.date
        if classes[date]?.count == 1 {
            classes.removeValue(forKey: date)
        } else {
            if let index = classes[date]?.firstIndex(of: oldClass) {
                classes[date]?.remove(at: index)
            }
        }
    }
    
    func getClasses() -> [Class] {
        // return assignments in sorted order
        let sortedDates = classes.keys.sorted()
        var sortedClasses: [Class] = []
        for key in sortedDates {
            sortedClasses += classes[key] ?? []
        }
        return sortedClasses
    }
}
