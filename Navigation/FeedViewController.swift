//
//  FeedViewController.swift
//  Navigation
//
//  Created by Алексей Сердюк on 18.12.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
    private var post = Post(title: "My first post")
    
    private lazy var button : UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 44))
        btn.backgroundColor = .systemBlue
        btn.tintColor = .white
        btn.setTitle("Read the post", for: .normal)
        btn.addTarget(self, action: #selector(didTapBtn), for: .touchUpInside)
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Feed"
        self.view.backgroundColor = .white
        self.view.addSubview(button)
        button.center = self.view.center
    }

    @objc func didTapBtn(){
        let controller = PostViewController()
        controller.title = post.title
        self.navigationController?.pushViewController(controller, animated: true)
    }

}

