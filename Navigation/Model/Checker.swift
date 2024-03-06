//
//  Checker.swift
//  Navigation
//
//  Created by Алексей Сердюк on 30.01.2024.
//

import Foundation

protocol LoginViewControllerDelegate {
    func checkResult(login: String, password: String, complition: @escaping (Result<Bool, LoginAuthErrors>)-> Void)
}

class Checker {
    static let shared = Checker()
    
    private let login: String = "Kot"
    private let password: String = "qwerty"
    
    private init(){}
    
    func check(login: String, password: String) -> Bool {
        
        self.login == login && self.password == password ? true : false
    }
}


struct LoginInspector : LoginViewControllerDelegate {
    
    func checkResult(login: String, password: String, complition: @escaping (Result<Bool, LoginAuthErrors>)-> Void) {
        guard Checker.shared.check(login: login, password: password) else {
            complition(.failure(.incorrectAccesses))
            return
        }
        
        complition(.success(true))
    }
}
