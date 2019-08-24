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
        view.layout()
        view.decorate()
        return view
    }
    private func layout() {

    }
    
    private func decorate() {
        searchResultTableView.separatorInset = .zero
        searchResultTableView.registerCellByNib(SearchResultTableViewCell.self)

//        searchResultTableView.rowHeight = UITableView.automaticDimension
//        searchResultTableView.estimatedRowHeight = 320
    }
}
