//
//  UserService.swift
//  Navigation
//
//  Created by Алексей Сердюк on 23.01.2024.
//

import UIKit


protocol UserService{
    func checkUser(login: String) -> User?
}

class User {
    let login: String
    let fullName: String
    let status: String
    let avatar: UIImage

    init(login: String, fullName: String, status: String, avatar: UIImage) {
        self.login = login
        self.fullName = fullName
        self.status = status
        self.avatar = avatar
    }
}

class CurrentUserService: UserService {
    
    let user: User
    
    init(user: User){
        self.user = user
    }
    
    func checkUser(login: String) -> User? {
        if user.login == login {
            return self.user
        } else {
            return nil
        }
    }
}

class TestUserService: UserService {
    
    let user: User = User(login: "Kot", fullName: "Sweet KotT", status: "HappyT", avatar: UIImage())

    func checkUser(login: String) -> User? {
        if user.login == login {
            return self.user
        } else {
            return nil
        }
    }
}
