//
//  SmartViews.swift
//  Navigation
//
//  Created by Алексей Сердюк on 06.02.2024.
//

import Foundation
import UIKit

class CustomButton : UIButton {
    
    var actionOnTap : () -> Void = {}
    
    init(title: String, titleColor: UIColor, backgroundColor: UIColor){
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.tintColor = titleColor
        self.backgroundColor = backgroundColor
        self.addTarget(self, action: #selector(buttonTapped( sender :)), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonTapped(sender: UIButton) {
        actionOnTap()
    }
    

}

