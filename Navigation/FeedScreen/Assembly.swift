//
//  Assembly.swift
//  Navigation
//
//  Created by Алексей Сердюк on 09.02.2024.
//

import Foundation

class FeedAssembly{
    
    func make() -> FeedViewController{
        
        let view = FeedViewController()
        let presenter = FeedPresenter(view: view)
        view.presenter = presenter
        
        return view
    }
}
