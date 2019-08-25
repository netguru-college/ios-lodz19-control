//
//  SearchFilesRequest.swift
//  NetguruCollegeApp
//

import Foundation

final class SearchFilesRequest: APIRequest {
    var path: String = ""
    var method: APIMethod = .get

    init(ownerName owner: String, repoName repo: String) {
        setPath(owner: owner, repo: repo)
    }

    private func setPath(owner: String, repo: String) {
        self.path = "/repos/\(owner)/\(repo)/readme"
    }
}
