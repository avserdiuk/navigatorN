//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Алексей Сердюк on 18.12.2023.
//

import UIKit

class ProfileViewController : UIViewController {
    
    private lazy var subView : ProfileHeaderView = {
        let view = ProfileHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var button: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Кнопка", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.tintColor = .white
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        self.view.backgroundColor = .white
        self.view.addSubview(subView)
        subView.backgroundColor = .white
        self.view.addSubview(button)
        
        NSLayoutConstraint.activate([
            subView.heightAnchor.constraint(equalToConstant: 220),
            subView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            subView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            subView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            
            button.heightAnchor.constraint(equalToConstant: 44),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
    }
}
