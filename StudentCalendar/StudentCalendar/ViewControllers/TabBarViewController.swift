//
//  TabBarViewController.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/21/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    let subjectController = SubjectController()
    let assignmentController = AssignmentController()
    let classController = ClassController()
    let assessmentController = AssessmentController()
    var eventController: EventController?

    override func viewDidLoad() {
        super.viewDidLoad()
        eventController = EventController(assignmentController: assignmentController,
                                          classController: classController,
                                          assessmentController: assessmentController)
        
        let math = Subject(title: "Math", colorName: "Blue")
        let english = Subject(title: "English", colorName: "Red")
        
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
        viewController.tabBarItem = UITabBarItem(title: "Schedule", image: UIImage(systemName: "calendar"), tag: 0)
        return UINavigationController(rootViewController: viewController)
    }
    
    func createAssignmentsViewController() -> UINavigationController {
        let viewController = AssignmentsViewController()
        viewController.assignmentController = assignmentController
        viewController.subjectController = subjectController
        viewController.title = "Tasks"
        viewController.tabBarItem = UITabBarItem(title: "Tasks", image: UIImage(systemName: "list.bullet"), tag: 1)
        return UINavigationController(rootViewController: viewController)
    }
    
    func createClassesViewController() -> UINavigationController {
        let viewController = UIViewController()
//        viewController.classController = classController
//        viewController.subjectController = subjectController
        viewController.title = "Classes"
        viewController.tabBarItem = UITabBarItem(title: "Classes", image: UIImage(systemName: "clock"), tag: 2)
        return UINavigationController(rootViewController: viewController)
    }
    
    func createAssessmentsViewController() -> UINavigationController {
        let viewController = UIViewController()
//        viewController.assessmentController = assessmentController
//        viewController.subjectController = subjectController
        viewController.title = "Tests"
        viewController.tabBarItem = UITabBarItem(title: "Tests", image: UIImage(systemName: "book"), tag: 3)
        return UINavigationController(rootViewController: viewController)
    }
}
