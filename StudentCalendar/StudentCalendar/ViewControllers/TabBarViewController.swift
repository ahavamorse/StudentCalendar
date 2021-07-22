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
    var eventController: EventController?

    override func viewDidLoad() {
        super.viewDidLoad()
        eventController = EventController(assignmentController: assignmentController,
                                          classController: classController,
                                          assessmentController: assessmentController)
        
        let math = Subject(title: "Math", instructor: "My Father", startDate: Date(), endDate: Date(), colorName: "Red", color: SubjectColor.red)
        assignmentController.add([Assignment(title: "Homeword", subject: math, type: .homework, pointValue: 10, instructions: "None", status: AssignmentStatus.assigned, date: Date().addingTimeInterval(1000))])
        classController.add([Class(title: "First Class", subject: math, date: Date(), endDate: Date())])
        assessmentController.add([Assessment(title: "Chapter 1 Test", subject: math, pointValue: 100, notes: "Study well!", type: AssesmentType.chapterTest, date: Date().addingTimeInterval(5000), endDate: Date())])
        
        viewControllers = [createScheduleViewController(),
                           createAssignmentsViewController(),
                           createClassesViewController(),
                           createAssessmentsViewController()]
    }
    
    func createScheduleViewController() -> UINavigationController {
        let viewController = ScheduleViewController()
        viewController.eventController = eventController
        viewController.title = "Schedule"
        viewController.tabBarItem = UITabBarItem(title: "Schedule", image: UIImage(systemName: "calendar"), tag: 0)
        return UINavigationController(rootViewController: viewController)
    }
    
    func createAssignmentsViewController() -> UINavigationController {
        let viewController = UIViewController()
//        viewController.assignmentController = assignmentController
        viewController.title = "Tasks"
        viewController.tabBarItem = UITabBarItem(title: "Tasks", image: UIImage(systemName: "list.bullet"), tag: 1)
        return UINavigationController(rootViewController: viewController)
    }
    
    func createClassesViewController() -> UINavigationController {
        let viewController = UIViewController()
//        viewController.classController = classController
        viewController.title = "Classes"
        viewController.tabBarItem = UITabBarItem(title: "Classes", image: UIImage(systemName: "clock"), tag: 2)
        return UINavigationController(rootViewController: viewController)
    }
    
    func createAssessmentsViewController() -> UINavigationController {
        let viewController = UIViewController()
//        viewController.assessmentController = assessmentController
        viewController.title = "Tests"
        viewController.tabBarItem = UITabBarItem(title: "Tests", image: UIImage(systemName: "book"), tag: 3)
        return UINavigationController(rootViewController: viewController)
    }
}
