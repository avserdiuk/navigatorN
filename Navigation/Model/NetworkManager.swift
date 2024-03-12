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

struct Model : Decodable{
    let userId : Int
    let id : Int
    let title: String
    let completed: Bool
}

struct Planet: Decodable {
    let name: String
    let rotationPeriod: String
    let orbitalPeriod: String
    let diameter: String
    let climate: String
    let gravity: String
    let terrain: String
    let surfaceWater: String
    let population: String
    let residents: [String]
    let films: [String]
    let created: String
    let edited: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter
        case climate
        case gravity
        case terrain
        case surfaceWater = "surface_water"
        case population
        case residents
        case films
        case created
        case edited
        case url
    }
}


struct NetworkManager {
    
    
    static func requestJsonCodable(complited: @escaping (Planet)->()){
        let url = URL(string: "https://swapi.py4e.com/api/planets/1/")
        
        if let url {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let data {
                    if let json = try? JSONDecoder().decode(Planet.self, from: data) {
                        complited(json)
                    }
                }
            }
            task.resume()
        }
    }
    
    
    
    
    
    static func requestJson(complition: @escaping (String)->Void){
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos/1")
        
        if let url {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let data {
                    if let info = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {
                        if let title = info["title"] as? String {
                            complition(title)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
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
