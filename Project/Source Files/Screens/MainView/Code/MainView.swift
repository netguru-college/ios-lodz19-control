//
//  MainView.swift
//  NetguruCollegeApp
//

import UIKit

final class MainView: UIView {
    @IBOutlet var searchResultTableView: UITableView!
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var searchButton: UIButton!

    class func instanceFromNib() -> UIView {
        let view = UINib(nibName: "MainView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! MainView
        view.setup()
        return view
    }

    private func setup() {
        searchResultTableView.separatorInset = .zero
        searchResultTableView.registerCellByNib(SearchResultTableViewCell.self)
        searchButton.titleLabel?.text = "Search"
    }
}
