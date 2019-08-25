//
//  FilesView.swift
//  NetguruCollegeApp
//

import UIKit

final class FilesView: UIView {

    class func instanceFromNib() -> UIView {
        return UINib(nibName: "FilesView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
}
