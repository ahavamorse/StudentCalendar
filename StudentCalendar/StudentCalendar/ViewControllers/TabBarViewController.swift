//
//  TabBarViewController.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/21/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    let assignmentController = AssignmentController()
    let classController = ClassController()
    let assessmentController = AssessmentController()
    let addEventViewController = AddEventViewController()
    var subjectController: SubjectController?
    var eventController: EventController?

    override func viewDidLoad() {
        super.viewDidLoad()
        eventController = EventController(assignmentController: assignmentController,
                                          classController: classController,
                                          assessmentController: assessmentController)
        subjectController = SubjectController(assignmentController: assignmentController,
                                              classController: classController,
                                              assessmentController: assessmentController)
        
        let math = Subject(title: "Math", colorName: "Blue")
        let english = Subject(title: "English", colorName: "Red")
        subjectController?.add([math, english])
        
        assignmentController.add([Assignment(title: "Chapter 1 Homework", subject: math, status: .notStarted, date: Date().addingTimeInterval(1000))])
        classController.add([Class(title: "First Class", subject: math, date: Date())])
        assessmentController.add([Assessment(title: "Chapter 1 Test", subject: math, date: Date().addingTimeInterval(5000))])
        assignmentController.add([Assignment(title: "Homework 2", subject: english, status: .notStarted, date: Date().addingTimeInterval(100000))])
        
        
        viewControllers = [createScheduleViewController(),
                           createAssignmentsViewController(),
                           createClassesViewController(),
                           createAssessmentsViewController()]
    }
    
    func createScheduleViewController() -> UINavigationController {
        let viewController = ScheduleViewController()
        viewController.eventController = eventController
        viewController.subjectController = subjectController
        viewController.title = "Schedule"
        viewController.tabBarItem = TabBarItem.schedule
        return UINavigationController(rootViewController: viewController)
    }
    
    func createAssignmentsViewController() -> UINavigationController {
        let viewController = AssignmentsViewController()
        viewController.assignmentController = assignmentController
        viewController.subjectController = subjectController
        viewController.addEventViewController = addEventViewController
        
        viewController.title = "Assignments"
        viewController.tabBarItem = TabBarItem.assignments
        return UINavigationController(rootViewController: viewController)
    }
    
    func createClassesViewController() -> UINavigationController {
        let viewController = ClassesViewController()
        viewController.classController = classController
        viewController.subjectController = subjectController
        viewController.addEventViewController = addEventViewController
        
        viewController.title = "Classes"
        viewController.tabBarItem = TabBarItem.classes
        return UINavigationController(rootViewController: viewController)
    }
    
    func createAssessmentsViewController() -> UINavigationController {
        let viewController = UIViewController()
//        viewController.assessmentController = assessmentController
//        viewController.subjectController = subjectController
//        viewController.addEventViewController = addEventViewController
        
        viewController.title = "Assessments"
        viewController.tabBarItem = TabBarItem.assessments
        return UINavigationController(rootViewController: viewController)
    }
}
