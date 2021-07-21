//
//  TabViewController.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/21/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import UIKit

class TabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [createScheduleViewController(), /*createSubjectsViewController()*/]
    }
    
    func createScheduleViewController() -> UIViewController {
        let viewController = ScheduleViewController()
        viewController.title = "Schedule"
        viewController.tabBarItem = UITabBarItem(title: "Schedule", image: UIImage(systemName: "calendar"), tag: 0)
        return viewController
    }
}
