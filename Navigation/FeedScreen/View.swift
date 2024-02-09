//
//  View.swift
//  Navigation
//
//  Created by Алексей Сердюк on 09.02.2024.
//

import Foundation
import UIKit

class FeedMainView : UIView {
    
    lazy var button1: CustomButton = {
        let btn = CustomButton(title: "Read the post btn 1", titleColor: .white, backgroundColor: .systemBlue)
        return btn
    }()
    
    lazy var button2: CustomButton = {
        let btn = CustomButton(title: "Read the post btn 2", titleColor: .white, backgroundColor: .systemBlue)
        return btn
    }()
    
    lazy var textField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter the text"
        tf.borderStyle = .roundedRect
        tf.text = "qwerty"
        return tf
    }()
    
    lazy var checkGuessButton: CustomButton = {
        let btn = CustomButton(title: "checkGuessButton", titleColor: .white, backgroundColor: .systemBlue)
        return btn
    }()
    
    private lazy var stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    lazy var result: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "result of check: "
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        backgroundColor = .white
        
        self.addSubview(stackView)
        self.stackView.addArrangedSubview(button1)
        self.stackView.addArrangedSubview(button2)
        
        self.stackView.addArrangedSubview(textField)
        self.stackView.addArrangedSubview(checkGuessButton)
        self.stackView.addArrangedSubview(result)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: super.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: super.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 200),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
