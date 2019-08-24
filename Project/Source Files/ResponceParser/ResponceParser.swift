//
//  ResponceParser.swift
//  NetguruCollegeApp
//

import Foundation

enum ResponceParserError: Error {
    case wrongResponce
}

class ResponceParser {
    func repoFound(data: Data?) throws -> [Repository] {
        var repositories : [Repository] = []
        if data != nil {
            let repoParser = RepoResponceParser()
            do {
                repositories = try repoParser.parceResponce(data: data!)
            } catch {
                throw ResponceParserError.wrongResponce
            }
        }
        return repositories
    }
    func userFound(data: Data?) {
        if data != nil {
            let userParser = UserResponceParser()
            userParser.parceResponce(data: data!)
        }
    }
}
