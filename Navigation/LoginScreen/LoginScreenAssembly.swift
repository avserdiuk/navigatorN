//
//  LoginScreenAssembly.swift
//  Navigation
//
//  Created by Алексей Сердюк on 10.02.2024.
//

import Foundation

class LoginScreenAssembly {
    func make() -> LogInViewController {
        
        #if DEBUG
                let currentUser = TestUserService()
        #else
                let currentUser = CurrentUserService(
                    user: User(login: "Kot", fullName: "Sweet Kot", status: "Happy", avatar: UIImage())
                )
        #endif
        
        let viewModel = LoginViewModel(user: currentUser.user)
        let view = LogInViewController()
        view.viewModel = viewModel
        
        return view
    }
}
