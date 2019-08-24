//
//  AppFlowCoordinator.swift
//  NetguruCollegeApp
//

import UIKit

final class AppFlowCoordinator: FlowCoordinator {

    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func initializeApp() {
        let viewController = HelloWorldViewController(delegate: self)
        rootViewController = UINavigationController(rootViewController: viewController)
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
}

extension AppFlowCoordinator: HelloWorldViewControllerDelegate {

    func didSelectNextButton() {
        let nextViewController = WelcomeViewController()
        rootViewController.show(nextViewController, sender: nil)
    }
}

extension AppFlowCoordinator: LoginViewViewControllerDelegate {
    
    func didSelectSignInButton() {
        // TODO: navigate to next screen
    }
}
