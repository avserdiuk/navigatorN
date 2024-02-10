//
//  ViewModel.swift
//  Navigation
//
//  Created by Алексей Сердюк on 10.02.2024.
//

import Foundation

protocol LoginViewModelProtocol : AnyObject{
    var user: User { get set }
    var result: Bool? { get set }
    var check: ((LoginViewModelProtocol) -> ())? { get set }
    
    func checkAccess(_ login: String, _ password: String)
}

class LoginViewModel : LoginViewModelProtocol {
    
    var user: User
    
    init(user: User) {
        self.user = user
    }
   
    var result: Bool? {
        didSet {
            self.check?(self)
        }
    }
    
    var check: ((LoginViewModelProtocol) -> ())?
    
    func checkAccess(_ login: String, _ password: String){
        
        let checkResult = LoginInspector().check(login: login, password: password)
        result = checkResult
    }
}
