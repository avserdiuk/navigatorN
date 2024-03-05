//
//  DCG.swift
//  Navigation
//
//  Created by Алексей Сердюк on 26.02.2024.
//

import Foundation

class Controller_1 {
    private var workItem : DispatchWorkItem?
    
    func reciveSearchResults(query: String){
        
        workItem?.cancel()
        
        let networkItem = DispatchWorkItem {
            print("Sent a request to tips backend for \(query)")
            // запрос в сеть
            // обработка данных ответа
        }
        
        workItem = networkItem
        
        DispatchQueue.global(qos: .userInitiated).asyncAfter(
            deadline: .now() + .milliseconds(30),
            execute: networkItem
        )
    }
}

let viewController = Controller_1()
//viewController.reciveSearchResults(query: "ф")
//viewController.reciveSearchResults(query: "фу")
//viewController.reciveSearchResults(query: "фут")
//Thread.sleep(forTimeInterval: Double.random(in: 2...5))
//viewController.reciveSearchResults(query: "футб")
//viewController.reciveSearchResults(query: "футбол")
 

