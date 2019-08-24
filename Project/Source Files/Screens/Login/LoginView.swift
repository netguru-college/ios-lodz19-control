//
//  LoginView.swift
//  NetguruCollegeApp
//

import UIKit

final class LoginView: UIView {

    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var signInButton: UIButton!
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "LoginView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
}
