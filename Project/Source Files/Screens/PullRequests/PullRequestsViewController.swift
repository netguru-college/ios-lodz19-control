//
//  PullRequestsViewController.swift
//  NetguruCollegeApp
//

import UIKit

final class PullRequestsViewController: UIViewController {

    private var customView: PullRequestsView {
        return view as! PullRequestsView
    }

    // MARK: - Functions

    init() {
        super.init(nibName: nil, bundle: nil)
        self.tabBarItem.title = "Pull Requests"
        self.tabBarItem.image = #imageLiteral(resourceName: "Pull_Requests")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
