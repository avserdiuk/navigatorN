//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Алексей Сердюк on 20.12.2023.
//

import UIKit

class ProfileHeaderView : UIView {
    
    private var statusText : String = ""
    
    private lazy var avatarImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.masksToBounds = true
        image.image = UIImage(named: "cat")
        image.layer.cornerRadius = 50
        image.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        image.layer.borderWidth = 3
        return image
    }()
    
    private lazy var fullNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hipster cat"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private lazy var statusLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Waiting for something..."
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    private lazy var statusTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = UIColor.systemGray6
        tf.placeholder = "set you status..."
        tf.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        tf.borderStyle = .roundedRect
        return tf
    }()
    
    private lazy var setStatusButton : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .systemBlue
        btn.setTitle("Show status", for: .normal)
        btn.tintColor = .white
        btn.layer.cornerRadius = 10
        btn.layer.masksToBounds = true
        btn.addTarget(self, action: #selector(didTapBtn), for: .touchUpInside)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .white

        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(setStatusButton)
        
        NSLayoutConstraint.activate([
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            avatarImageView.leadingAnchor.constraint(equalTo: super.leadingAnchor, constant: 16),
            avatarImageView.topAnchor.constraint(equalTo: super.topAnchor, constant: 16),
            
            fullNameLabel.centerXAnchor.constraint(equalTo: super.centerXAnchor),
            fullNameLabel.topAnchor.constraint(equalTo: super.topAnchor, constant: 27),
            
            statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor, constant: 0),
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 10),
            
            statusTextField.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor, constant: 0),
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
            statusTextField.trailingAnchor.constraint(equalTo: super.trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 34),
            
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: super.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: super.trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 44),
            setStatusButton.bottomAnchor.constraint(equalTo: super.bottomAnchor, constant: -16)
            
        ])
    }
    
    @objc func didTapBtn(){
        print("prev status: \(statusLabel.text ?? "")" )
        statusLabel.text = statusText
    }
    
    @objc func statusTextChanged(_ textField: UITextField){
        statusText = textField.text ?? "no status"
    }
}
