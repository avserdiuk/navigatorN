//
//  MVP.swift
//  Navigation
//
//  Created by Алексей Сердюк on 08.02.2024.
//

import Foundation
import UIKit

// MVP = Model View Presenter

// M = Model

struct Person_ {
    let firstName : String
    let lastName: String
}

// P = Presenter

protocol GreetingPresenterProtocol : AnyObject{
    func showGreeting()
}

class GreetingPresenter: GreetingPresenterProtocol {
    
    weak var view : GreetingViewProtocol?
    let model: Person
    
    init(view: GreetingViewProtocol, model: Person) {
        self.view = view
        self.model = model
    }
    
    func showGreeting() {
        let greeting = "Hello" + " " + model.firstName + " " + model.lastName
        view?.updateGreeting(greeting: greeting)
    }
}

// V = View

protocol GreetingViewProtocol : AnyObject {
    func updateGreeting(greeting: String)
}

class GreetingViewController_ :  UIViewController, GreetingViewProtocol {
    var presenter: GreetingPresenterProtocol!
    
    let greetingButton = UIButton()
    let greetingLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingButton.addTarget(self, action: #selector(didTapBtn(sender:)), for: .touchUpInside)
    }
    
    @objc
    func didTapBtn(sender: UIButton){
        presenter.showGreeting()
    }
    
    func updateGreeting(greeting: String) {
        greetingLabel.text = greeting
    }
}

// Assembly (Сборщик)


class GreetingScreenAssembly {
    
    func make() -> GreetingViewController_ {
        let model = Person(firstName: "", lastName: "")
        let view = GreetingViewController_()
        let presenter = GreetingPresenter(view: view, model: model)
        
        view.presenter = presenter
        
        return view
    }
}

let screen_ = GreetingScreenAssembly().make()
