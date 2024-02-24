//
//  FeedViewController.swift
//  Navigation
//
//  Created by Алексей Сердюк on 18.12.2023.
//

import UIKit

protocol FeedViewProtocol : AnyObject {
    
    func showPostViewController()
    func updateResult(result: Bool)
}

class FeedViewController: UIViewController, FeedViewProtocol {
    
    var presenter: FeedPresenterProtocol!
    var coordinator: FeedCoordinator?
    
    override func loadView() {
        self.view = FeedMainView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Feed"
        
        setup()
    }
    
    private func view() -> FeedMainView {
        return self.view as! FeedMainView
    }
    
    private func didTapBtn(){
        presenter.action()
    }
    
    private func didTapCheckBtn(){
        let word = self.view().textField.text ?? ""
        presenter.check(word: word)
    }
    
    func showPostViewController(){
        coordinator?.showPostScreen()
    }
    
    func updateResult(result: Bool){
        if result {
            self.view().result.backgroundColor = .systemGreen
        } else {
            self.view().result.backgroundColor = .systemRed
        }
        
        self.view().result.text = "result of check: \(result)"
    }
    
    private func setup(){
        view().button1.actionOnTap = { self.didTapBtn() }
        view().button2.actionOnTap = { self.didTapBtn() }
        view().checkGuessButton.actionOnTap = { self.didTapCheckBtn() }
    }
}

