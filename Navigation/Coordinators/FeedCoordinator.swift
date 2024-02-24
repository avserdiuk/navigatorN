//
//  FeedCoordinator.swift
//  Navigation
//
//  Created by Алексей Сердюк on 24.02.2024.
//

import Foundation
import UIKit

class FeedCoordinator : Coordinator {
    var childs: [Coordinator] = []
    var transitionHandler: UINavigationController
    
    init(transitionHandler: UINavigationController) {
        self.transitionHandler = transitionHandler
    }
    
    func start(){
        print("Feed Coordinator Start")
    }
    
    func showPostScreen() {
        transitionHandler.pushViewController(PostViewController(), animated: true)
    }
}
