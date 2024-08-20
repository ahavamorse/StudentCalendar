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
    var eventController: EventController
    var subjectController: SubjectController
    
    init() {
        eventController = EventController(assignmentController: assignmentController,
                                          classController: classController,
                                          assessmentController: assessmentController)
        subjectController = SubjectController(assignmentController: assignmentController,
                                              classController: classController,
                                              assessmentController: assessmentController)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [createScheduleViewController(),
                           createAssignmentsViewController(),
                           createClassesViewController(),
                           createAssessmentsViewController()]
        
        addExampleData()
    }
    
    private func createScheduleViewController() -> UINavigationController {
        let viewController = ScheduleViewController(eventController: eventController, subjectController: subjectController)
        viewController.tabBarItem = TabBarItem.schedule
        return UINavigationController(rootViewController: viewController)
    }
    
    private func createAssignmentsViewController() -> UINavigationController {
        let viewController = AssignmentsViewController(assignmentController: assignmentController, subjectController: subjectController)
        viewController.tabBarItem = TabBarItem.assignments
        return UINavigationController(rootViewController: viewController)
    }
    
    private func createClassesViewController() -> UINavigationController {
        let viewController = ClassesViewController(classController: classController, subjectController: subjectController)
        viewController.tabBarItem = TabBarItem.classes
        return UINavigationController(rootViewController: viewController)
    }
    
    private func createAssessmentsViewController() -> UINavigationController {
        let viewController = AssessmentsViewController(assessmentController: assessmentController, subjectController: subjectController)
        viewController.tabBarItem = TabBarItem.assessments
        return UINavigationController(rootViewController: viewController)
    }
    
    private func addExampleData() {
        let math = Subject(title: "Math", colorName: "Blue")
        let english = Subject(title: "English", colorName: "Red")
        subjectController.add([math, english])
        
        assignmentController.add([Assignment(title: "Chapter 1 Homework", subject: math, status: .notStarted, date: Date().addingTimeInterval(1000))])
        classController.add([Class(title: "First Class", subject: math, date: Date())])
        assessmentController.add([Assessment(title: "Chapter 1 Test", subject: math, date: Date().addingTimeInterval(5000))])
        assignmentController.add([Assignment(title: "Homework 2", subject: english, status: .notStarted, date: Date().addingTimeInterval(100000))])
    }
}
