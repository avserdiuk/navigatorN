//
//  LogInViewController.swift
//  Navigation
//
//  Created by Алексей Сердюк on 06.01.2024.
//

import UIKit

class LogInViewController : UIViewController {
    
    private lazy var scrollView : UIScrollView = {
        var scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.layer.borderWidth = 1
        scrollView.layer.borderColor = CGColor(gray: 1, alpha: 1)
        return scrollView
    }()
    
    private lazy var logoImage: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var stackView : UIStackView = {
        var stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.layer.cornerRadius = 10
        return stackView
    }()
    
    private lazy var loginTextField: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.placeholder = "Email or Phone"
        textField.backgroundColor = .systemGray6
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.placeholder = "Password"
        textField.backgroundColor = .systemGray6
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        var btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = UIColor(named: "#4885CC")
        btn.tintColor = .white
        btn.setTitle("Log In", for: .normal)
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .white
        
        setupViews()
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapView)))
        
        NotificationCenter.default.addObserver(self, selector: #selector(didShowKeyboard(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(didHideKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func didShowKeyboard(_ notificatoion: Notification){
        if let keyboardFrame: NSValue = notificatoion.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
            let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            let topPadding = window?.safeAreaInsets.top ?? 0
            
            let loginButtomBottomPoint = loginButton.frame.maxY + topPadding
            let keyboardOriginY = view.frame.height - keyboardHeight
            
            let yOffset = keyboardOriginY < loginButtomBottomPoint ? loginButtomBottomPoint - keyboardOriginY + 16 : 0

            scrollView.contentOffset = CGPoint(x: 0, y: yOffset)

        }
    }
    
    @objc func didHideKeyboard(){
        view.endEditing(true)
        scrollView.contentOffset = CGPoint(x: 0, y: 0)
        print(#function)
    }
    
    @objc private func didTapLoginButton(){
        navigationController?.pushViewController(ProfileViewController(), animated: true)
    }
    
    @objc private func didTapView(){
        view.endEditing(true)
    }
    
    private func setupViews(){
        
        view.addSubview(scrollView)
        scrollView.addSubview(logoImage)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(loginTextField)
        stackView.addArrangedSubview(passwordTextField)
        scrollView.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            logoImage.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 120),
            
            stackView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 120),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
            
            
        ])
    }
}
