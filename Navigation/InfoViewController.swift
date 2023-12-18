//
//  InfoViewController.swift
//  Navigation
//
//  Created by Алексей Сердюк on 18.12.2023.
//

import UIKit

class InfoViewController : UIViewController {
    
    private lazy var button : UIButton = {
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
        btn.tintColor = .white
        btn.backgroundColor = .systemBlue
        btn.setTitle("Show Alert!", for: .normal)
        btn.addTarget(self, action: #selector(didTapBtn), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(button)
        self.button.center = self.view.center
    }
    
    @objc func didTapBtn(){
        let alert = UIAlertController(title: "Pay attention please!", message: "This is an alert.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Print", style: .default){ _ in
            print("alert is work")
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .destructive))
        self.present(alert, animated: true, completion: nil)
        
    }
}
