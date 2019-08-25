//
//  LoginButton.swift
//  NetguruCollegeApp
//


import UIKit

final class LoginButtonView: UIView {
    
    let avatarImageView = UIImageView()
    let userManager: UserManager
    private let loginIcon = "login_icon"
    private let size = 25
    
    init(userManager: UserManager) {
        self.userManager = userManager
        super.init(frame: CGRect(x: 0, y: 0, width: size, height: size))
        addSubview(avatarImageView)
        updateIcon()
        avatarImageView.sizeToFit()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateIcon() {
        userManager.setAvatarUrl()
        if let avatarUrl = userManager.avatarUrl {
            avatarImageView.load(url: URL(string: avatarUrl)!)
        } else {
            avatarImageView.image = UIImage(named: loginIcon)
        }
    }
}
