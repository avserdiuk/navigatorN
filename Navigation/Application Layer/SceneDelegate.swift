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
        
        //        let url = ["https://swapi.dev/api/people/8", "https://swapi.dev/api/starships/3", "https://swapi.dev/api/planets/5"]
        //
        //        let appConfiguration: AppConfiguration = AppConfiguration.first(url[Int.random(in: 0...2)])
        //        NetworkManager.request(for: appConfiguration)
        
        //        NetworkManager.request()
        
//        NetworkManager.requestJsonCodable { model in
//            print(model)
//        }
        
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

