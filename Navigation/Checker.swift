//
//  Checker.swift
//  Navigation
//
//  Created by Алексей Сердюк on 30.01.2024.
//

import Foundation

protocol LoginViewControllerDelegate {
    func check(login: String, password: String) -> Bool
}

class Checker {
    static let shared = Checker()
    
    private let login: String = "Kot"
    private let password: String = "qwerty"
    
    private init(){}
    
    func check(login: String, password: String) -> Bool {
        
//        if self.login == login && self.password == password {
//            return true
//        } else {
//            return false
//        }
        
        self.login == login && self.password == password ? true : false
    }
}


struct LoginInspector : LoginViewControllerDelegate {
    func check(login: String, password: String) -> Bool {
        Checker.shared.check(login: login, password: password) ? true : false
    }
}
