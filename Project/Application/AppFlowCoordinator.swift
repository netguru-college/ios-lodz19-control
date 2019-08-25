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

    func setTabBarAsRoot(with repoModel: Repository) {
        let tabBarViewController = UITabBarController()
        let readmeViewController = ReadmeViewController(withRepository: repoModel)
        let filesViewController = FilesViewController()
        let pullRequestsViewController = PullRequestsViewController(repository: repoModel)
        let otherViewController = OtherViewController()
        tabBarViewController.setViewControllers([readmeViewController, filesViewController, pullRequestsViewController, otherViewController], animated: true)
        rootViewController.show(tabBarViewController, sender: nil)
    }
}

extension AppFlowCoordinator: HelloWorldViewControllerDelegate {

    func didSelectNextButton() {
        let nextViewController = WelcomeViewController()
        rootViewController.show(nextViewController, sender: nil)
    }
}

extension AppFlowCoordinator: MainViewControllerDelegate {
    func repositorySelected(repository: Repository) {
        setTabBarAsRoot(with: repository)
    }
}

extension AppFlowCoordinator: LoginViewViewControllerDelegate {
    func didSelectSignInButton() {
        // TODO: navigate to next screen
    }
}
