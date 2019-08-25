//
//  FilesProvider.swift
//  NetguruCollegeApp
//

import Foundation

protocol FilesProviderDelagate: AnyObject {
    func didReceiveReadmeUrl(url: String)
    func didReceiveError(error: Error)
    func gotWrongResponse()
}

final class FilesProvider {

    let parser = ResponseParser()
    weak var delegate: FilesProviderDelagate?
    private let apiClient = APIClient()

    func searchReadme(repository: Repository) {
        let request = SearchFilesRequest(withParameters: ["ref": "master"], ownerName: repository.owner, repoName: repository.name)
        apiClient.sendRequest(request: request, success: { data in
            guard let data = data else { return }
            do {
                let url = try self.parser.readmeFound(data: data)
                self.delegate?.didReceiveReadmeUrl(url: url)
            } catch {
                self.delegate?.gotWrongResponse()
            }
        }) { error in
            if let error = error {
                self.delegate?.didReceiveError(error: error)
            }
        }
    }
}
