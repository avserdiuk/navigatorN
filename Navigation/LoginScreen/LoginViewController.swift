//
//  LogInViewController.swift
//  Navigation
//
//  Created by Алексей Сердюк on 06.01.2024.
//

import UIKit

protocol LoginViewProtocol : AnyObject{
    
}

class LogInViewController : UIViewController, LoginViewProtocol {
    var viewModel: LoginViewModelProtocol! {
        didSet {
            self.viewModel.check = { [weak self] viewModel in
                self?.result(checkResult: viewModel.result!, user: viewModel.user)
            }
        }
    }
    
    weak var coordinator: LoginCoordinator?
    
    override func loadView() {
        view = LoginView()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapView)))
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        view().loginButton.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        addNotifications()
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(didTapLoginButton), userInfo: nil, repeats: false)
    
       
        
    }
    
    private func view() -> LoginView {
        return self.view as! LoginView
    }
   
    @objc private func didTapLoginButton(){
        
        #if DEBUG
                let login = "Kot"
                let password = "qwerty"
        #else
                let login = view().loginTextField.text ?? ""
                let password = view().passwordTextField.text ?? ""
        #endif
        
        self.viewModel.checkAccess(login, password)
        
    }
    
    func result(checkResult: Bool, user: User){
        
        guard checkResult else {
            let alert = UIAlertController(title: "Внимание", message: "Не верный логин или пароль", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        coordinator?.showProfileScreen(user: user)
    }
    
    func addNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(didShowKeyboard(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(didHideKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func didTapView(){
        view.endEditing(true)
    }
    
    @objc func didShowKeyboard(_ notificatoion: Notification){
        if let keyboardFrame: NSValue = notificatoion.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
            let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            let topPadding = window?.safeAreaInsets.top ?? 0
            
            let loginButtomBottomPoint = view().loginButton.frame.maxY + topPadding
            let keyboardOriginY = view.frame.height - keyboardHeight
            
            let yOffset = keyboardOriginY < loginButtomBottomPoint ? loginButtomBottomPoint - keyboardOriginY + 16 : 0
            
            view().scrollView.contentOffset = CGPoint(x: 0, y: yOffset)
        }
    }
    
    @objc func didHideKeyboard(){
        view.endEditing(true)
        view().scrollView.contentOffset = CGPoint(x: 0, y: 0)
    }
    
  
}
