//
//  LoginButton.swift
//  NetguruCollegeApp
//


import UIKit

class LoginButtonView: UIView {
    
    let avatarImageView = UIImageView()
    let userManager: UserManager
    private let size = 28
    private let loginIcon = "login_icon"
    
    init(userManager: UserManager) {
        self.userManager = userManager
        super.init(frame: CGRect(x: 0, y: 0, width: size, height: size))
        addSubview(avatarImageView)
        avatarImageView.sizeToFit()
        updateIcon()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateIcon() {
        if let avatarUrl = userManager.avatarUrl {
            avatarImageView.image = UIImage(contentsOfFile: avatarUrl)
        } else {
            avatarImageView.image = UIImage(named: loginIcon)
        }
    }
}
