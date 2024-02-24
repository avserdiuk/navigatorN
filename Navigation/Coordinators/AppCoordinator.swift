//
//  AppCoordinator.swift
//  Navigation
//
//  Created by Алексей Сердюк on 24.02.2024.
//

import Foundation
import UIKit

class AppCoordinator : Coordinator {
    var childs: [Coordinator] = []
    
    private var transitionHandler : UITabBarController
    
    init(transitionHandler: UITabBarController) {
        self.transitionHandler = transitionHandler
    }
    
    func start(){
        print("App Coordinator start")
        setupStartSceen()
    }
    
    func setupStartSceen(){
        
        let controller1 = FeedAssembly().make()
            controller1.tabBarItem.title = "Feed"
            controller1.tabBarItem.image = UIImage(systemName: "list.bullet")
        
        let feedTransitionHandler = UINavigationController(rootViewController: controller1)
        let feedCoordinator = FeedCoordinator(transitionHandler: feedTransitionHandler)
        
        controller1.coordinator = feedCoordinator
        feedCoordinator.start()
        
        
        let controller2 = LoginScreenAssembly().make()
            controller2.tabBarItem.title = "Profile"
            controller2.tabBarItem.image = UIImage(systemName: "person")
        
        let loginTransitionHandler = UINavigationController(rootViewController: controller2)
        let loginCoordinator = LoginCoordinator(transitionHandler: loginTransitionHandler)
        
        controller2.coordinator = loginCoordinator
        loginCoordinator.start()
        
        transitionHandler.viewControllers = [
            feedTransitionHandler,
            loginTransitionHandler
        ]
        
        self.childs.append(feedCoordinator)
        self.childs.append(loginCoordinator)
    }
    
}
