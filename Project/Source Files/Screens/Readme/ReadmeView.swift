//
//  ReadmeView.swift
//  NetguruCollegeApp
//

import UIKit

final class ReadmeView: UIView {
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "ReadmeView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
}
