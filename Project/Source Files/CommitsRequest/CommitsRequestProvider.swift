//
//  CommitsRequestProvider.swift
//  NetguruCollegeApp
//


import Foundation

protocol CommitsRequestProviderDelegate: NSObject {
    func commitsRequestFetched(commitsRequest: [CommitsResponse])
    func errorOccured()
}

final class CommitsRequestProvider {
    private let apiClient: APIClientProtocol

    weak var delegate: CommitsRequestProviderDelegate?

    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }

    func commitsRequests(for owner: String, in repo: String) {
        let request = CommitsRequestApiRequest(owner: owner, repo: repo)
        apiClient.sendRequest(request: request, success: { data in
            guard let data = data, let objects = try? CommitsResponseParser().parceResponse(data: data) else {
                self.delegate?.errorOccured()
                return
            }
            self.delegate?.commitsRequestFetched(commitsRequest: objects)
        }) { _ in
            self.delegate?.errorOccured()
        }
    }
}
