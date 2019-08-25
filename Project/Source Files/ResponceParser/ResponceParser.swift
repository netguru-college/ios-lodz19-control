//
//  ResponceParser.swift
//  NetguruCollegeApp
//

import Foundation

enum ResponseParserError: Error {
    case wrongResponce
}

final class ResponceParser {
    func repoFound(data: Data?) throws -> [Repository] {
        var repositories : [Repository] = []
        if data != nil {
            let repoParser = RepoResponseParser()
            do {
                repositories = try repoParser.parceResponce(data: data!)
            } catch {
                throw ResponseParserError.wrongResponce
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
