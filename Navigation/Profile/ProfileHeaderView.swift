//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Алексей Сердюк on 20.12.2023.
//

import UIKit

class ProfileHeaderView : UIView {
    
    private var statusText : String = ""
    
    private lazy var avatar: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 15, y: 100, width: 100, height: 100))
        image.layer.masksToBounds = true
        image.image = UIImage(named: "cat")
        image.layer.cornerRadius = 50
        image.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        image.layer.borderWidth = 3
        return image
    }()
    
    private lazy var nameLabel : UILabel = {
        let label = UILabel(frame: CGRect(x: 140, y: 60, width: 200, height: 100))
        label.text = "Hipster cat"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private lazy var statusLabel : UILabel = {
        let label = UILabel(frame: CGRect(x: 140, y: 90, width: 200, height: 100))
        label.text = "Waiting for something..."
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    private lazy var textField: UITextField = {
        let tf = UITextField(frame: CGRect(x: 140, y: 160, width: 235, height: 44))
        tf.backgroundColor = UIColor.systemGray6
        tf.layer.masksToBounds = true
        tf.layer.cornerRadius = 10
        tf.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        tf.placeholder = "set you status..."
        tf.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        tf.setPadding(left: 5)
        return tf
    }()
    
    private lazy var button : UIButton = {
        let btn = UIButton(frame: CGRect(x: 15, y: 210, width: 360, height: 50))
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
        addSubview(avatar)
        addSubview(nameLabel)
        addSubview(statusLabel)
        addSubview(textField)
        addSubview(button)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTapBtn(){
        print("prev status: \(statusLabel.text ?? "")" )
        statusLabel.text = statusText
    }
    
    @objc func statusTextChanged(_ textField: UITextField){
        statusText = textField.text ?? "no status"
    }
}
