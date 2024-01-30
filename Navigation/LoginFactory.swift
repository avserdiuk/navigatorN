//
//  LoginFactory.swift
//  Navigation
//
//  Created by Алексей Сердюк on 30.01.2024.
//

import Foundation


protocol LoginFactory {
    func makeLoginInspector() -> LoginInspector
}

struct MyLoginFactory: LoginFactory{
    func makeLoginInspector() -> LoginInspector {
        return LoginInspector()
    }
}
