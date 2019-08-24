//
//  MainViewController.swift
//  NetguruCollegeApp
//

import UIKit

protocol MainViewControllerDelegate: AnyObject {
    func searchButtonAction()
}

final class MainViewController: UIViewController {

    private var mainView: MainView {
        return view as! MainView
    }

    private weak var delegate: MainViewControllerDelegate?
    private var viewModel: MainViewModelProtocol

    init(delegate: MainViewControllerDelegate?, viewModel: MainViewModelProtocol) {
        self.delegate = delegate
        self.viewModel = viewModel
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
        viewModel.fetchData()
    }

    private func setupView() {
        mainView.searchButton.addTarget(self, action: #selector(search), for: .touchUpInside)
        setupTableView()
    }

    @objc func search() {
        delegate?.searchButtonAction()
    }

    private func setupTableView() {
        mainView.searchResultTableView.dataSource = self
        mainView.searchResultTableView.delegate = self
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
        #warning("Add logic later")
    }
}

extension MainViewController: ReusableView { }
