//
//  FeedViewController.swift
//  Navigation
//
//  Created by Алексей Сердюк on 18.12.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    private var post = Post(title: "My first post")
    
    private lazy var button1 : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .systemBlue
        btn.tintColor = .white
        btn.setTitle("Read the post", for: .normal)
        btn.addTarget(self, action: #selector(didTapBtn), for: .touchUpInside)
        return btn
    }()
    
    private lazy var button2 : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .systemBlue
        btn.tintColor = .white
        btn.setTitle("Read the post", for: .normal)
        btn.addTarget(self, action: #selector(didTapBtn), for: .touchUpInside)
        return btn
    }()
    
    private lazy var stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Feed"
        self.view.backgroundColor = .white
        self.view.addSubview(stackView)
        self.stackView.addArrangedSubview(button1)
        self.stackView.addArrangedSubview(button2)
       
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 200),
        ])
        
    }

    @objc func didTapBtn(){
        let controller = PostViewController()
        controller.title = post.title
        self.navigationController?.pushViewController(controller, animated: true)
    }

}

