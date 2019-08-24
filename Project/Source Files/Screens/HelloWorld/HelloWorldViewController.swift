//
//  HelloWorldViewController.swift
//  NetguruCollegeApp
//

import UIKit
import OAuthSwift

protocol HelloWorldViewControllerDelegate: AnyObject {
    func didSelectNextButton()
}

class HelloWorldViewController: UIViewController {

    private var customView: HelloWorldView {
        return view as! HelloWorldView
    }
    var authorization = Authorization()

    private weak var delegate: HelloWorldViewControllerDelegate?
    private let userManager: UserManager

    // MARK: - Functions

    init(delegate: HelloWorldViewControllerDelegate?, userManager: UserManager) {
        self.delegate = delegate
        self.userManager = userManager
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = HelloWorldView.instanceFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        customView.nextButton.addTarget(self, action: #selector(nextAction), for: .touchUpInside)
    }

    @objc func nextAction() {
        delegate?.didSelectNextButton()
    }
}
