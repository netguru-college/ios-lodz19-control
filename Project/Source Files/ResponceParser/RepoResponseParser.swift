//
//  RepoResponseParser.swift
//  NetguruCollegeApp
//

import Foundation

class RepoResponseParser {
    func parceResponse(data: Data) throws -> [Repository] {
        var repositories: [Repository] = []
        do {
            //Create an array of JSONS
            if let responseArray = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                do {
                    repositories = try parseRepoArray(array: responseArray)
                } catch {
                    throw ResponseParserError.wrongResponse
                }
            }
        } catch {
            throw ResponseParserError.wrongResponse
        }
        return repositories
    }
    
    func parseRepoArray(array: [String: Any]) throws -> [Repository] {
        var parsed: [Repository] = []
        
        if let repoArray = array["items"] as? [Any] {
            for repoData in repoArray {
                if let repoItem = repoData as? [String : Any] {
                    let repo = convertRepoItemToObject(item: repoItem)
                    if repo != nil {
                        parsed.append(repo!)
                    }
                }
            }
        } else {
            throw ResponseParserError.wrongResponse
        }
        return parsed
    }
    
    func convertRepoItemToObject(item: [String: Any]) -> Repository? {
        var repository: Repository?
        guard let name = item["name"] as? String else { return nil }
        guard let description = item["description"] as? String else { return nil }
        guard let language = item["language"] as? String else {
            return nil
        }
        guard let dateString = item["updated_at"] as? String else {
            return nil
        }
        guard let owner = item["owner"] as? [String : Any] else { return nil }
        guard let ownerName = owner["login"] as? String else { return nil }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let lastUpdateOn = dateFormatter.date(from: dateString) else {
            return nil
        }
        repository = Repository(name: name, description: description, language: language, lastUpdateOn: lastUpdateOn, owner: ownerName)
        return repository
    }
}
