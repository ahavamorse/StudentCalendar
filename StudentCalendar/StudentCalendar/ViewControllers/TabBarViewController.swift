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
        viewControllers = [createScheduleViewController(), createSubjectsViewController()]
    }
    
    func createScheduleViewController() -> UINavigationController {
        let viewController = ScheduleViewController()
        viewController.title = "Schedule"
        viewController.tabBarItem = UITabBarItem(title: "Schedule", image: UIImage(systemName: "calendar"), tag: 0)
        return UINavigationController(rootViewController: viewController)
    }
    
    func createSubjectsViewController() -> UINavigationController {
        let viewController = UIViewController()
        viewController.title = "Subjects"
        viewController.tabBarItem = UITabBarItem(title: "Subjects", image: UIImage(systemName: "list.bullet"), tag: 1)
        return UINavigationController(rootViewController: viewController)
    }
}
