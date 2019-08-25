//
//  LoginButton.swift
//  NetguruCollegeApp
//


import UIKit
import Kingfisher

protocol LoginButtonViewDelegate: class {
    func loginButtoNTapped()
}

final class LoginButtonView: UIView {
    
    weak var loginButtonDelegate: LoginButtonViewDelegate?
    
    let avatarImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
    let avatarButton = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
    let userManager: UserManager
    private let loginIcon = "login_icon"
    private let size = 25
    
    init(userManager: UserManager) {
        self.userManager = userManager
        super.init(frame: CGRect(x: 0, y: 0, width: size, height: size))
        addSubview(avatarImageView)
        addSubview(avatarButton)
        avatarButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        avatarImageView.contentMode = .scaleAspectFill
        updateIcon()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateIcon() {
        if let avatarUrl = userManager.avatarUrl {
            avatarImageView.kf.setImage(with: URL(string: avatarUrl)!)
        } else {
            avatarImageView.image = UIImage(named: loginIcon)
        }
    }
    
    @objc func buttonTapped() {
        loginButtonDelegate?.loginButtoNTapped()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateIcon()
    }
}
