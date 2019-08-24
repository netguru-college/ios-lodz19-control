//
//  MainViewModel.swift
//  NetguruCollegeApp
//


import Foundation
import UIKit

struct TempModel {
    let name: String
    let description: String
    let language: String
    let date: Date?

    init(name: String, description: String, language: String, date: Date? = nil) {
        self.name = name
        self.description = description
        self.language = language
        self.date = date
    }
}

protocol MainViewModelProtocol: AnyObject {
    var delegate: MainViewModelDelegate! { get set }
    var dataSourceCount: Int { get }

    func fetchData()
    func selectedTask(at row: Int)
    func item(at indexPath: IndexPath) -> TempModel
}

protocol MainViewModelDelegate: AnyObject {
     func reloadData()
}

final class MainViewModel {
    weak var delegate: MainViewModelDelegate!

    private var dataSource: [TempModel] = []

    init() {
    }
}

extension MainViewModel: MainViewModelProtocol {
    var dataSourceCount: Int {
        return dataSource.count
    }

    func fetchData() {
        #warning("Temp waiting for Api response")
        let data = TempModel(name: "Hello", description: "dsdasd", language: "Swift")
        dataSource.append(data)
        delegate.reloadData()
    }

    func selectedTask(at row: Int) {
        #warning("Add logic later")
    }

    func item(at indexPath: IndexPath) -> TempModel {
        return dataSource[indexPath.row]
    }
}
