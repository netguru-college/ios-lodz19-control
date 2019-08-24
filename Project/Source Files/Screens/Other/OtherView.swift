//
//  OtherView.swift
//  NetguruCollegeApp
//

import UIKit

final class OtherView: UIView {

    class func instanceFromNib() -> UIView {
        return UINib(nibName: "OtherView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
}
