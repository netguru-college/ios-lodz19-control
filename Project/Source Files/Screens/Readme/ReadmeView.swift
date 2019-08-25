//
//  ReadmeView.swift
//  NetguruCollegeApp
//

import UIKit
import MarkdownView

final class ReadmeView: UIView {
    @IBOutlet var markdownView: MarkdownView!
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "ReadmeView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
}
