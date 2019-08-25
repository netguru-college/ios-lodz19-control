//
//  AuthenticatedUserRequest.swift
//  NetguruCollegeApp
//


import Foundation

final class AuthenticatedUserRequest: APIRequest {
    var path = "/user"
    var method = APIMethod.get
}
