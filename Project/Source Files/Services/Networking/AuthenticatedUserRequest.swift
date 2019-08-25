//
//  AuthenticatedUserRequest.swift
//  NetguruCollegeApp
//


import Foundation

class AuthenticatedUserRequest: APIRequest {
    var path = "/user"
    var method = APIMethod.get
}
