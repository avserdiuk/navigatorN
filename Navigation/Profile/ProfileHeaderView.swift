//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Алексей Сердюк on 20.12.2023.
//

import UIKit
import SnapKit

class ProfileHeaderView : UIView {
    
    private var statusText : String = ""
    private var avatarCenter : CGPoint = CGPoint()
    
    private lazy var hiddenView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.isHidden = true
        view.alpha = 0
        return view
    }()
    
    private lazy var closeImageView : UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "x.circle"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .white
        imageView.alpha = 0
        imageView.isUserInteractionEnabled = true
        imageView.alpha = 0.7
        return imageView
    }()
    
    lazy var avatarImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.masksToBounds = true
        image.image = UIImage(named: "cat")
        image.layer.cornerRadius = 50
        image.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        image.layer.borderWidth = 3
        image.isUserInteractionEnabled = true
        image.layer.zPosition = 1
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
        
        avatarImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapAvatar)))
        closeImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapClose)))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didTapAvatar(){
        
        self.hiddenView.isHidden = false
        self.avatarCenter = avatarImageView.center
        
        let height = UIScreen.main.bounds.height
        let width = UIScreen.main.bounds.width
        
        UIView.animate(withDuration: 1) {
            self.avatarImageView.center = CGPoint(x: width/2, y: height/2)
            self.avatarImageView.transform = CGAffineTransform(scaleX: width/100, y: width/100)
            self.hiddenView.alpha = 0.6
            self.avatarImageView.layer.cornerRadius = 0
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.closeImageView.alpha = 1
                
            }
        }
    }
    
    @objc func didTapClose(){
        UIView.animate(withDuration: 1) {
            self.avatarImageView.center = self.avatarCenter
            self.avatarImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.avatarImageView.layer.cornerRadius = 50
            self.hiddenView.alpha = 0.0
        }
    }
    
    func setup(){
        
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(setStatusButton)
        addSubview(hiddenView)
        addSubview(closeImageView)
        
            avatarImageView.snp.makeConstraints { (make) -> Void in
                let view = superview ?? UIView()
                
                make.height.equalTo(100)
                make.width.equalTo(100)
                make.left.equalTo(view).offset(16)
                make.top.equalTo(view).offset(16)
            }
        
            fullNameLabel.snp.makeConstraints { (make) -> Void in
                let view = superview ?? UIView()
    
                make.centerX.equalTo(view.snp.centerX)
                make.top.equalTo(view.snp.top).offset(27)
            }
        
            statusLabel.snp.makeConstraints { (make) -> Void in

                make.leading.equalTo(fullNameLabel.snp.leading).offset(0)
                make.top.equalTo(fullNameLabel.snp.bottom).offset(10)
            }
        
        
        
        
        
        NSLayoutConstraint.activate([

//            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
//            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
//            avatarImageView.leadingAnchor.constraint(equalTo: super.leadingAnchor, constant: 16),
//            avatarImageView.topAnchor.constraint(equalTo: super.topAnchor, constant: 16),

//            fullNameLabel.centerXAnchor.constraint(equalTo: super.centerXAnchor),
//            fullNameLabel.topAnchor.constraint(equalTo: super.topAnchor, constant: 27),

//            statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor, constant: 0),
//            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 10),

            statusTextField.leadingAnchor.constraint(equalTo: statusLabel.leadingAnchor, constant: 0),
            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
            statusTextField.trailingAnchor.constraint(equalTo: super.trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 34),

            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: super.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: super.trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 44),
            setStatusButton.bottomAnchor.constraint(equalTo: super.bottomAnchor, constant: -16),

            hiddenView.topAnchor.constraint(equalTo: super.topAnchor),
            hiddenView.leadingAnchor.constraint(equalTo: super.leadingAnchor),
            hiddenView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height),
            hiddenView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),

            closeImageView.widthAnchor.constraint(equalToConstant: 30),
            closeImageView.heightAnchor.constraint(equalToConstant: 27),
            closeImageView.topAnchor.constraint(equalTo: super.topAnchor, constant: 20),
            closeImageView.trailingAnchor.constraint(equalTo: super.trailingAnchor, constant: -20),

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
