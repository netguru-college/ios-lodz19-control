//
//  ResponseParser.swift
//  NetguruCollegeApp
//

import Foundation

enum ResponseParserError: Error {
    case wrongResponse
}

final class ResponseParser {
    func repoFound(data: Data?) throws -> [Repository] {
        var repositories : [Repository] = []
        if data != nil {
            let repoParser = RepoResponseParser()
            do {
                repositories = try repoParser.parceResponse(data: data!)
            } catch {
                throw ResponseParserError.wrongResponse
            }
        }
        return repositories
    }
    func userFound(data: Data?) {
        if data != nil {
            let userParser = UserResponseParser()
            userParser.parseResponse(data: data!)
        }
    }
}
