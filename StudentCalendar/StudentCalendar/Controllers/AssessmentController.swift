//
//  AssessmentController.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/22/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import Foundation

class AssessmentController {
    
    private var assessments: [Date: [Assessment]] = [:]
    
    init(assessments: [Assessment] = []) {
        add(assessments)
    }
    
    func add(_ newAssessments: [Assessment]) {
        // put assessments in dictrionary by date
        for newAssessment in newAssessments {
            if assessments[newAssessment.date] == nil {
                assessments[newAssessment.date] = [newAssessment]
            } else {
                assessments[newAssessment.date]?.append(newAssessment)
            }
        }
    }
    
    func remove(_ oldAssessment: Assessment) {
        // remove assessment from list
        let date = oldAssessment.date
        if assessments[date]?.count == 1 {
            assessments.removeValue(forKey: date)
        } else {
            if let index = assessments[date]?.firstIndex(of: oldAssessment) {
                assessments[date]?.remove(at: index)
            }
        }
    }
    
    func getClasses() -> [Assessment] {
        // return assessments in sorted order
        let sortedDates = assessments.keys.sorted()
        var sortedAssessments: [Assessment] = []
        for key in sortedDates {
            sortedAssessments += assessments[key] ?? []
        }
        return sortedAssessments
    }
}
