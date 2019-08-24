//
//  SearchRequest.swift
//  NetguruCollegeApp
//

import Foundation

final class SearchProjectRequest: APIRequest {
    var path: String = "/search/repositories"
    var method: APIMethod = .get
    var parameters: [String: String] = [:]
}
