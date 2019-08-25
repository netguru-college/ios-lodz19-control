//
//  PullRequest.swift
//  NetguruCollegeApp
//


import Foundation

enum PullRequestStatus {
    case open
    case closed
}

struct PullRequest {
    var name: String
    var status: PullRequestStatus
    
    init(name: String, status: PullRequestStatus) {
        self.name = name
        self.status = status
    }
}
