//
//  AppFlowCoordinator.swift
//  NetguruCollegeApp
//

import UIKit

final class AppFlowCoordinator: FlowCoordinator {

    private let window: UIWindow
    private let dependencies: Dependencies

    init(window: UIWindow) {
        self.window = window
        dependencies = Dependencies()
    }

    func initializeApp() {
        let viewModel = MainViewModel()
        let viewController = MainViewController(delegate: self, viewModel: viewModel, userManager: dependencies.userManager)
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

extension AppFlowCoordinator: MainViewControllerDelegate {
    func searchButtonAction() {

    }
}

extension AppFlowCoordinator: LoginViewViewControllerDelegate {
    
    func didSelectSignInButton() {
        // TODO: navigate to next screen
    }
}
