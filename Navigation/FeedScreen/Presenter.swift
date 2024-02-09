//
//  FeedPresenter.swift
//  Navigation
//
//  Created by Алексей Сердюк on 09.02.2024.
//

import Foundation

protocol FeedPresenterProtocol : AnyObject{
    func action()
    func check(word: String)
}

class FeedPresenter: FeedPresenterProtocol {
    weak var view: FeedViewProtocol?
    
    init(view: FeedViewProtocol) {
        self.view = view
    }
    
    func action(){
        view?.showPostViewController()
    }
    
    func check(word: String){
        FeedModel().check(word){ result in
            self.view?.updateResult(result: result)
        }
    }
}
