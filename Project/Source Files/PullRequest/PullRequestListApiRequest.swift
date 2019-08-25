//
//  PullRequestListApiRequest.swift
//  NetguruCollegeApp
//

import Foundation

final class PullRequestListApiRequest: APIRequest {
    private let owner: String
    private let repo: String
    var path: String {
        return "/repos/\(owner)/\(repo)/pulls"
    }
    var method: APIMethod = .get
    var parameters: [String: String]? {
        return ["state": "all"]
    }

    init(owner: String, repo: String) {
        self.owner = owner
        self.repo = repo
    }

}
