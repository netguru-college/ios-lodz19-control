//
//  MainViewController.swift
//  NetguruCollegeApp
//


import UIKit

protocol MainViewControllerDelegate: AnyObject {

}

final class MainViewController: UIViewController {

    private var mainView: MainView {
        return view as! MainView
    }

    private weak var delegate: MainViewControllerDelegate?

    init(delegate: MainViewControllerDelegate?) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = MainView.instanceFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
