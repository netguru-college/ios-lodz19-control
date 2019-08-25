//
//  ReadmeViewController.swift
//  NetguruCollegeApp
//


import UIKit

final class ReadmeViewController: UIViewController {

    private var customView: ReadmeView {
        return view as! ReadmeView
    }
    
    // MARK: - Functions
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.tabBarItem.title = "Read me"
        self.tabBarItem.image = #imageLiteral(resourceName: "Read_Me")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
