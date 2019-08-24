//
//  LoginViewController.swift
//  NetguruCollegeApp
//


import UIKit

final class LoginViewController: UIViewController {

    private var customView: LoginView {
        return view as! LoginView
    }
    
    // MARK: - Functions
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = LoginView.instanceFromNib()
    }
}
