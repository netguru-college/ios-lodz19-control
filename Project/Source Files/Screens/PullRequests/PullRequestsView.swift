//
//  PullRequestsView.swift
//  NetguruCollegeApp
//

import UIKit

final class PullRequestsView: UIView {

    @IBOutlet var tableView: UITableView!
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "PullRequestView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
}
