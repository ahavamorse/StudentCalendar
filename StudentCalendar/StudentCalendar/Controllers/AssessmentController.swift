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
    var delegate: EventController?
    var subjectController: SubjectController?
    
    init(assessments: [Assessment] = []) {
        add(assessments)
    }
    
    func add(_ newAssessments: [Assessment]) {
        // put assessments in dictionary by date
        for newAssessment in newAssessments {
            if assessments[newAssessment.date] == nil {
                assessments[newAssessment.date] = [newAssessment]
            } else {
                assessments[newAssessment.date]?.append(newAssessment)
            }
        }
        delegate?.add(newAssessments)
        subjectController?.add(newAssessments)
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
        delegate?.redo()
        subjectController?.remove(oldAssessment)
    }
    
    func remove(_ event: Event) {
        if let assessments = self.assessments[event.date] {
            for index in 0...assessments.count {
                if compare(assessment: assessments[index], event: event) {
                    self.assessments[event.date]?.remove(at: index)
                    return
                }
            }
        }
    }
    
    func compare(assessment: Assessment, event: Event) -> Bool {
        if assessment.date == event.date,
            assessment.title == event.title,
            assessment.subject.title == event.subject.title {
            return true
        } else {
            return false
        }
    }
    
    func getAssessments() -> [Assessment] {
        // return assessments in sorted order
        let sortedDates = assessments.keys.sorted()
        var sortedAssessments: [Assessment] = []
        for key in sortedDates {
            sortedAssessments += assessments[key] ?? []
        }
        return sortedAssessments
    }
    
    func getSortedAssessments() -> ([Subject], [String: [Assessment]]) {
        var subjects: [Subject] = []
        var assessments: [String: [Assessment]] = [:]
        for assessment in getAssessments() {
            let subject = assessment.subject
            if assessments[subject.title] != nil {
                assessments[subject.title]?.append(assessment)
            } else {
                subjects.append(subject)
                assessments[subject.title] = [assessment]
            }
        }
        return (subjects, assessments)
    }
}
