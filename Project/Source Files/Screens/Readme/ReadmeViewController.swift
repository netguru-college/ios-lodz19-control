//
//  ReadmeViewController.swift
//  NetguruCollegeApp
//


import UIKit

final class ReadmeViewController: UIViewController {

    private var customView: ReadmeView {
        return view as! ReadmeView
    }
    private let filesProvider = FilesProvider()
    private let apiClient = APIClient()
    // MARK: - Functions
    
    init(withRepository repo: Repository) {
        super.init(nibName: nil, bundle: nil)
        filesProvider.delegate = self
        self.tabBarItem.title = "Read me"
        self.tabBarItem.image = #imageLiteral(resourceName: "Read_Me")
        filesProvider.searchReadme(repository: repo)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ReadmeViewController: FilesProviderDelagate {
    func didReceiveError(error: Error) {

    }

    func gotWrongResponse() {

    }

    func didReceiveReadmeUrl(url: String) {
        apiClient.getUrlContent(urlString: url) { string in
            DispatchQueue.main.async {
                self.customView.markdownView.load(markdown: string)
            }
        }
    }
}
