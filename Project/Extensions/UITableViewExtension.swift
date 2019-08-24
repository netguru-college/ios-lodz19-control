//
//  UITableViewExtension.swift
//  NetguruCollegeApp
//

import UIKit

extension UITableView {
    func registerCellByNib<T: UITableViewCell>(_ cellClass: T.Type) {
        register(UINib(nibName: String(describing: cellClass), bundle: nil), forCellReuseIdentifier: cellClass.reuseIdentifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
}
