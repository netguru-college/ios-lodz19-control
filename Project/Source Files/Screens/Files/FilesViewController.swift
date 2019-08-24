//
//  FilesViewController.swift
//  NetguruCollegeApp
//

import UIKit

final class FilesViewController: UIViewController {

    private var customView: FilesView {
        return view as! FilesView
    }

    // MARK: - Functions

    init() {
        super.init(nibName: nil, bundle: nil)
        self.tabBarItem.title = "Files"
        self.tabBarItem.image = #imageLiteral(resourceName: "Files")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
