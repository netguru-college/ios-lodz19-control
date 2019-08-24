//
//  RepoResponceParser.swift
//  NetguruCollegeApp
//

import Foundation

class RepoResponceParser {
    func parceResponce(data: Data) throws -> [Repository] {
        var repositories: [Repository] = []
        do {
            //Create an array of JSONS
            if let responceArray = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                do {
                    repositories = try parseRepoArray(array: responceArray)
                } catch {
                    throw ResponceParserError.wrongResponce
                }
            }
        } catch {
            throw ResponceParserError.wrongResponce
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
                        parced.append(repo!)
                    }
                }
            }
        } else {
            throw ResponceParserError.wrongResponce
        }
        return parced
    }
    
    func convertRepoItemToObject(item: [String: Any]) -> Repository? {
        var repository: Repository?
        guard let name = item["full_name"] as? String else { return nil }
        guard let description = item["description"] as? String else { return nil }
        guard let language = item["language"] as? String else {
            return nil
        }
        guard let dateString = item["updated_at"] as? String else {
            return nil
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let lastUpdateOn = dateFormatter.date(from: dateString) as? Date else{ return nil }
        repository = Repository(name: name, description: description, language: language, lastUpdateOn: lastUpdateOn)
        return repository
    }
}
