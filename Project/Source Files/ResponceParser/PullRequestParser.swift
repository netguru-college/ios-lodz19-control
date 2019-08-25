//
//  PullRequestParser.swift
//  NetguruCollegeApp
//

import Foundation

final class PullRequestParser {

    func parceResponse(data: Data) throws -> [PullRequest] {
        do {
            if let responseArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                return try parsePullRequestArray(array: responseArray)
            } else {
                throw ResponseParserError.wrongResponse
            }
        } catch {
            throw ResponseParserError.wrongResponse
        }
    }

    func parsePullRequestArray(array: [[String: Any]]) throws -> [PullRequest] {
        return try array.compactMap { item in
            guard let body = item["title"] as? String,
                let status = item["state"] as? String else {
                    throw ResponseParserError.wrongResponse
            }
            return PullRequest(title: body, status: status)
        }
    }
}
