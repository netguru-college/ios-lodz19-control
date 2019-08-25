//
//  CommitsResponseParser.swift
//  NetguruCollegeApp
//


import Foundation

final class CommitsResponseParser {

    func parceResponse(data: Data) throws -> [CommitsResponse] {
        do {
            if let responseArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                return try parseCommitsRequestArray(array: responseArray)
            } else {
                throw ResponseParserError.wrongResponse
            }
        } catch {
            throw ResponseParserError.wrongResponse
        }
    }

    func parseCommitsRequestArray(array: [[String: Any]]) throws -> [CommitsResponse] {
        #warning("not Done yet")
//        return try array.compactMap { item in
//            guard let name = item[] as? String,
//                let status = item["state"] as? String else {
//                    throw ResponseParserError.wrongResponse
//            }
            return CommitsResponse(name: name, date: <#T##Date#>, message: <#T##String#>)
        }
    }


}
