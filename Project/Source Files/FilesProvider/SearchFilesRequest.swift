//
//  SearchFilesRequest.swift
//  NetguruCollegeApp
//

import Foundation

final class SearchFilesRequest: APIRequest {
    var path: String = ""
    var method: APIMethod = .get
    var parameters: [String: String]?

    init(withParameters parameters: [String: String], ownerName owner: String, repoName repo: String) {
        self.parameters = parameters
        setPath(owner: owner, repo: repo)
    }

    private func setPath(owner: String, repo: String) {
        self.path = "/repos/\(owner)/\(repo)/readme"
    }
}
