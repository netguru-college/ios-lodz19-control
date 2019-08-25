//
//  CommitsRequestApiRequest.swift
//  NetguruCollegeApp
//


import Foundation

final class CommitsRequestApiRequest: APIRequest {
    private let owner: String
    private let repo: String
    var path: String {
        return "/repos/\(owner)/\(repo)/commits"
    }
    var method: APIMethod = .get

    init(owner: String, repo: String) {
        self.owner = owner
        self.repo = repo
    }

}
