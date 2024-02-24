//
//  SceneDelegate.swift
//  Navigation
//
//  Created by Алексей Сердюк on 18.12.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var rootCoordinator: Coordinator?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        #if DEBUG
            print("DEBUG SCHEME IS ON")
            
        #else
            print("RESEASE SCHEME IS ON")
        #endif

        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.backgroundColor = .systemGray6
        tabBarController.tabBar.barStyle = .default
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = tabBarController
       
        let coordinator = AppCoordinator(transitionHandler: tabBarController)
        rootCoordinator = coordinator
        
        window?.makeKeyAndVisible()
        coordinator.start()
    }

}

