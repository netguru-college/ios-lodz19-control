//
//  ReadmeResponseParses.swift
//  NetguruCollegeApp
//

import Foundation

final class ReadmeResponseParser {
    func parseResponse(data: Data) throws -> String {
        //Create an array of JSONS
        if let responseArray = try JSONSerialization.jsonObject(with: data, options: [])
            as? [String: Any] {
            if let url = responseArray["download_url"] as? String {
                return url
            } else {
                throw ResponseParserError.wrongResponse
            }
        } else {
            throw ResponseParserError.wrongResponse
        }
    }
}

