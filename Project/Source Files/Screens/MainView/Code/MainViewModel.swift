//
//  MainViewModel.swift
//  NetguruCollegeApp
//

import Foundation
import UIKit

protocol MainViewModelProtocol: AnyObject {
    var delegate: MainViewModelDelegate! { get set }
    var texts: MainViewModel.Texts { get }
    var dataSourceCount: Int { get }

    func fetchData(with text: String)
    func selectedRow(at row: Int) -> Repository 
    func item(at indexPath: IndexPath) -> MainViewModel.RepositoryCellModel
}

protocol MainViewModelDelegate: AnyObject {
    func reloadData()
}

final class MainViewModel {
    struct Texts {
        let defaultPlaceholder = "Enter searching repositorium"
        let emptyTextFieldPlaceholder = "Wrong searching input"
    }

    struct RepositoryCellModel {
        let name: String
        let description: String?
        let language: String
        let lastUpdateOn: String
        let imageURl: String?

        init(data: Repository, dataFormater: DateFormatter) {
            self.name = data.fullName
            self.description = data.description
            self.language = data.language
            self.lastUpdateOn = dataFormater.string(from: data.lastUpdateOn)
            self.imageURl = data.avatarUrl
        }
    }

    weak var delegate: MainViewModelDelegate!

    private lazy var dateFormaterr: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }()

    private var dataSource: [Repository] = []
}

extension MainViewModel: MainViewModelProtocol {
    var texts: MainViewModel.Texts {
        return Texts()
    }

    var dataSourceCount: Int {
        return dataSource.count
    }

    func fetchData(with text: String) {
        let searchProvider = SearchProvider()
        searchProvider.delegate = self
        searchProvider.seachProject(nameContains: text)
    }

    func selectedRow(at row: Int) -> Repository {
        return dataSource[row]
    }

    func item(at indexPath: IndexPath) -> RepositoryCellModel {
        let cellModel = RepositoryCellModel(data: dataSource[indexPath.row], dataFormater: dateFormaterr)
        return cellModel
    }
}

extension MainViewModel: SearchProviderDelegate {
    func receivedRepositories(repoArray: [Repository]) {
        let tempData = repoArray
        dataSource = tempData
        delegate.reloadData()
    }

    func receivedUsers(repoArray: [User]) {
        #warning("Add Logic Later")
    }

    func gotWrongResponse() {
        #warning("Add Logic Later")
    }
}
