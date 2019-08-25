//
//  PullRequestProvider.swift
//  NetguruCollegeApp
//

import Foundation

protocol PullRequestProvierDelegate: NSObject {
    func pullRequestsFetched(pullRequest: [PullRequest])
    func errorOccured()
}

final class PullRequestProvider {

    private let apiClient: APIClientProtocol
    weak var delegate: PullRequestProvierDelegate?

    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }

    func fetchPullRequests(for user: String, in repo: String) {
        let request = PullRequestListApiRequest(owner: user, repo: repo)
        apiClient.sendRequest(request: request, success: { data in
            guard let data = data, let objects = try? PullRequestParser().parceResponse(data: data) else {
                self.delegate?.errorOccured()
                return
            }
            self.delegate?.pullRequestsFetched(pullRequest: objects)
        }) { _ in
            self.delegate?.errorOccured()
        }
    }
}
