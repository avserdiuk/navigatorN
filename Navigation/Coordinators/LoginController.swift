//
//  LoginController.swift
//  Navigation
//
//  Created by Алексей Сердюк on 24.02.2024.
//

import Foundation
import UIKit

class LoginCoordinator : Coordinator {
    var childs: [Coordinator] = []
    var transitionHandler: UINavigationController
    
    init(transitionHandler: UINavigationController) {
        self.transitionHandler = transitionHandler
    }
    
    func start(){
        print("Login Coordinator Start")
    }
    
    func showProfileScreen(user: User) {
        let controller = ProfileViewController()
        controller.user = user
        transitionHandler.pushViewController(controller, animated: true)
    }
}

