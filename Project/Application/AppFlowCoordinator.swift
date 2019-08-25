//
//  AppFlowCoordinator.swift
//  NetguruCollegeApp
//

import UIKit

final class AppFlowCoordinator: FlowCoordinator {

    private let window: UIWindow
    private let dependencies: Dependencies
    private let authorization = Authorization()

    init(window: UIWindow) {
        self.window = window
        dependencies = Dependencies()
        
    }

    func initializeApp() {
        let viewModel = MainViewModel()
        let viewController = MainViewController(delegate: self, viewModel: viewModel, userManager: dependencies.userManager)
        rootViewController = UINavigationController(rootViewController: viewController)
        viewController.navigationItem.rightBarButtonItem = loginButton()
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }

    func setTabBarAsRoot() {
        let tableViewController = UITabBarController()
        let readmeViewController = ReadmeViewController()
        let filesViewController = FilesViewController()
        let pullRequestsViewController = PullRequestsViewController()
        let otherViewController = OtherViewController()
        tableViewController.setViewControllers([readmeViewController, filesViewController, pullRequestsViewController, otherViewController], animated: true)
        rootViewController = tableViewController
    }

    func loginButton() -> UIBarButtonItem {
        dependencies.userManager.setAvatarUrl()
        let buttonView = LoginButtonView(userManager: dependencies.userManager)
        let loginButton = UIBarButtonItem(customView: buttonView)
        loginButton.action = #selector(loginSelected)
        return loginButton
        
//        return UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(loginSelected))
    }

    @objc func loginSelected() {
        if dependencies.userManager.isLogged {
            
        } else {
            
            authorization.authorize { [weak self] token, error in
                guard let self = self else { return }
                if let token = token {
                    self.dependencies.userManager.oauthToken = token
                } else {
                    // to do
                }
            }
        }
    }
}

extension AppFlowCoordinator: HelloWorldViewControllerDelegate {

    func didSelectNextButton() {
        let nextViewController = WelcomeViewController()
        rootViewController.show(nextViewController, sender: nil)
    }
}

extension AppFlowCoordinator: MainViewControllerDelegate {
    func searchButtonAction() {

    }
}

extension AppFlowCoordinator: LoginViewViewControllerDelegate {
    
    func didSelectSignInButton() {
        // TODO: navigate to next screen
    }
}
