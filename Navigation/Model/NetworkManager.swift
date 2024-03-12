//
//  NetworkManager.swift
//  Navigation
//
//  Created by Алексей Сердюк on 12.03.2024.
//

import Foundation

enum AppConfiguration {
    case first(String)
    case second(String)
    case third(String)
}

struct NetworkManager {
    static func request(for configuration: AppConfiguration) {
        var request : URL? = nil
        
        switch configuration {
            case .first(let url):
                request = URL(string: url)
            case .second(let url):
                request = URL(string: url)
            case .third(let url):
                request = URL(string: url)
        }
        
        let task = URLSession.shared.dataTask(with: request!) { data, response, error in
            if let data {
                if let encodingData = String(data: data, encoding: .utf8) {
                    print("encodingData:", encodingData)
                }
            }
            
            if let response {
                if let httpResponse = response as? HTTPURLResponse {
                    print("statusCode:", httpResponse.statusCode)
                    print("allHeaderFields:", httpResponse.allHeaderFields)
                }
            }
            
            if let error {
                print("localizedDescription:", error.localizedDescription)
            }
            
        }
        
        task.resume()
        
        
    }
}
