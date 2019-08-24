//
//  LoginViewController.swift
//  NetguruCollegeApp
//

import UIKit

protocol LoginViewViewControllerDelegate: AnyObject {
    func didSelectSignInButton()
}

final class LoginViewController: UIViewController {

    private var customView: LoginView {
        return view as! LoginView
    }
    
    private var viewModel: LoginViewViewModel
    
    private weak var delegate: LoginViewViewControllerDelegate?
    
    // MARK: - Functions
    
    init(viewModel: LoginViewViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = LoginView.instanceFromNib()
        customView.signInButton.addTarget(self, action: #selector(signInAction), for: .touchUpInside)
    }
    
    @objc func signInAction() {
        guard
            let username = customView.usernameTextField.text,
            let password = customView.passwordTextField.text
        else {
            return
        }
        let loginSuccess = viewModel.signInUser(username: username, password: password)
        
        if loginSuccess {
            delegate?.didSelectSignInButton()
        } else {
            // TODO: show error
        }
    }
}
