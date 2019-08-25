//
//  CommitsRequestProvider.swift
//  NetguruCollegeApp
//


import Foundation

protocol CommitsRequestProvider: NSObject {
    func commitsRequestFetched(commitsRequest: [C])
}
