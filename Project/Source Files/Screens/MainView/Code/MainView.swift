//
//  MainView.swift
//  NetguruCollegeApp
//


import UIKit

final class MainView: UIView {

    class func instanceFromNib() -> UIView {
        return UINib(nibName: "MainView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
}
