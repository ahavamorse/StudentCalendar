//
//  TabBarViewController.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/21/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [createScheduleViewController(), createAssignmentsViewController(), createClassesViewController(), createAssessmentsViewController()]
    }
    
    func createScheduleViewController() -> UINavigationController {
        let viewController = ScheduleViewController()
        viewController.title = "Schedule"
        viewController.tabBarItem = UITabBarItem(title: "Schedule", image: UIImage(systemName: "calendar"), tag: 0)
        return UINavigationController(rootViewController: viewController)
    }
    
    func createAssignmentsViewController() -> UINavigationController {
        let viewController = UIViewController()
        viewController.title = "Tasks"
        viewController.tabBarItem = UITabBarItem(title: "Tasks", image: UIImage(systemName: "list.bullet"), tag: 1)
        return UINavigationController(rootViewController: viewController)
    }
    
    func createClassesViewController() -> UINavigationController {
        let viewController = UIViewController()
        viewController.title = "Classes"
        viewController.tabBarItem = UITabBarItem(title: "Classes", image: UIImage(systemName: "clock.fill"), tag: 2)
        return UINavigationController(rootViewController: viewController)
    }
    
    func createAssessmentsViewController() -> UINavigationController {
        let viewController = UIViewController()
        viewController.title = "Tests"
        viewController.tabBarItem = UITabBarItem(title: "Tests", image: UIImage(systemName: "book.fill"), tag: 3)
        return UINavigationController(rootViewController: viewController)
    }
}
