//
//  Model.swift
//  Navigation
//
//  Created by Алексей Сердюк on 09.02.2024.
//

import Foundation

class FeedModel {
    let secretWord = "qwerty"
    
    func check(_ word: String, complition: @escaping (Bool) -> Void)  {
        let result =  secretWord == word ? true : false
        complition(result)
    }
}
