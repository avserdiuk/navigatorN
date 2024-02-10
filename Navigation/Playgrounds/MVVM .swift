//
//  MVVM .swift
//  Navigation
//
//  Created by Алексей Сердюк on 07.02.2024.
//

import Foundation
import UIKit

// MVVM = Model View ViewModel

// M = Model

struct Person {
    let firstName : String
    let lastName: String
}

// VM = ViewModel

protocol GreetingViewModelProtocol {
    var greeting: String? { get }
    var greetingDidChange: ((GreetingViewModelProtocol) -> ())? { get set }
    
    func showGreeting()
}

class GreetingViewModel: GreetingViewModelProtocol {
    let model: Person
    
    var greeting: String? {
        didSet {
            self.greetingDidChange?(self)
        }
    }
    
    var greetingDidChange: ((GreetingViewModelProtocol) -> ())?
    
    init(model: Person) {
        self.model = model

    }
    
    func showGreeting() {
        greeting = "Hello" + " " + model.firstName  + model.lastName
    }
    
}

// V = View

class GreetingViewController : UIViewController {
    var viewModel: GreetingViewModelProtocol! {
        didSet {
            self.viewModel.greetingDidChange = { [weak self] viewModel in 
                self?.greetingLabel.text = viewModel.greeting
            }
        }
    }
    
    let showGreetingButton = UIButton()
    let greetingLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showGreetingButton.addTarget(viewModel, action: #selector(didTapButton(sender: )), for: .touchUpInside)
    }
    
    @objc
    func didTapButton(sender: UIButton){
        viewModel.showGreeting()
    }
}

// Assambly (Сборщик)

class GreetingAssambly {
    func make() -> GreetingViewController {
        let model = Person(firstName: "Alex", lastName: "Serduyk")
        let viewModel = GreetingViewModel(model: model)
        let view = GreetingViewController()
        view.viewModel = viewModel
        
        return view
    }
}


let screen = GreetingAssambly().make()
