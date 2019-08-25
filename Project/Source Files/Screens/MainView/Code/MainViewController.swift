//
//  MainViewController.swift
//  NetguruCollegeApp
//

import UIKit

protocol MainViewControllerDelegate: AnyObject {
    func selectedRow(with indexPath: TempModel)
}

final class MainViewController: UIViewController {

    private var mainView: MainView {
        return view as! MainView
    }

    private weak var delegate: MainViewControllerDelegate?
    private var viewModel: MainViewModelProtocol
    private let userManager: UserManager

    init(delegate: MainViewControllerDelegate?, viewModel: MainViewModelProtocol, userManager: UserManager) {
        self.delegate = delegate
        self.viewModel = viewModel
        self.userManager = userManager
        super.init(nibName: nil, bundle: nil)
        self.viewModel.delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = MainView.instanceFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    private func setupView() {
        mainView.searchButton.addTarget(self, action: #selector(search), for: .touchUpInside)
        setupTableView()
    }

    @objc func search() {
        isTextFieldFiled()
    }

    private func setupTableView() {
        mainView.searchResultTableView.dataSource = self
        mainView.searchResultTableView.delegate = self
        mainView.searchTextField.placeholder = viewModel.texts.defaultPlaceholder
        mainView.searchTextField.clearButtonMode = .always
    }

    private func isTextFieldFiled() {
        guard let text = mainView.searchTextField.text,
            !text.isEmpty else {
                mainView.searchTextField.placeholder = viewModel.texts.emptyTextFieldPlaceholder
                return
        }
        viewModel.fetchData(with: text)
    }
}

extension MainViewController: MainViewModelDelegate {
    func reloadData() {
        mainView.searchResultTableView.reloadData()
    }
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSourceCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SearchResultTableViewCell = tableView.dequeueReusableCell(indexPath: indexPath)
        cell.updateData(with: viewModel.item(at: indexPath))
        return cell
    }
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.selectedRow(with: viewModel.item(at: indexPath))
    }
}

extension MainViewController: ReusableView { }
