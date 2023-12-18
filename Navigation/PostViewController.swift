//
//  PostViewController.swift
//  Navigation
//
//  Created by Алексей Сердюк on 18.12.2023.
//

import UIKit

class PostViewController : UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray4
        
        let barButton = UIBarButtonItem(image: .add, style: .plain, target: self, action: #selector(didTapBarButton))
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    @objc func didTapBarButton(){
        self.present(InfoViewController(), animated: true)
    }
}
