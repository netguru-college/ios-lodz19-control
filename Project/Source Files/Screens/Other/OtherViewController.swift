//
//  OtherViewController.swift
//  NetguruCollegeApp
//


import UIKit

final class OtherViewController: UIViewController {

    private var customView: OtherView {
        return view as! OtherView
    }

    // MARK: - Functions

    init() {
        super.init(nibName: nil, bundle: nil)
        self.tabBarItem.title = "Other"
        self.tabBarItem.image = #imageLiteral(resourceName: "Other")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
