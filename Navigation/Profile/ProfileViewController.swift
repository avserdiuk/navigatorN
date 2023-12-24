//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Алексей Сердюк on 18.12.2023.
//

import UIKit

class ProfileViewController : UIViewController {
    
    private lazy var subView : ProfileHeaderView = {
        let view = ProfileHeaderView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        self.view.backgroundColor = .white
        self.view.addSubview(subView)
        subView.backgroundColor = .white
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        subView.frame = super.view.frame
    }
}
