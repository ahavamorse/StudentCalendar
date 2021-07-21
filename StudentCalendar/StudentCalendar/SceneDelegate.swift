//
//  SceneDelegate.swift
//  StudentCalendar
//
//  Created by HapiDani on 7/21/21.
//  Copyright © 2021 ahavamorse. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        let scheduleViewController = ScheduleViewController() as UIViewController
        let navigationController = UINavigationController(rootViewController: scheduleViewController)
        navigationController.navigationBar.prefersLargeTitles = true
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}
