//
//  APIClient.swift
//  NetguruCollegeApp
//

import Foundation

protocol APIClientProtocol {
    func sendRequest(request: APIRequest, success: @escaping (Data?) -> Void, failure: @escaping (Error?) -> Void)
    func sendRequestAndDecode<T: Decodable>(request: APIRequest, success: @escaping (T) -> Void, failure: @escaping (Error?) -> Void
    )
}

final class APIClient: APIClientProtocol {

    let baseURL = "https://api.github.com"
    let sessionConfiguration = URLSessionConfiguration.default
    lazy var session = URLSession(configuration: sessionConfiguration)

    /// Creates API request and sends it. Closures are run on main thread.
    ///
    /// - Parameters:
    ///   - endpoint: endpoint to call
    ///   - method: HTTP method
    ///   - urlParameters: url parameters
    ///   - success: closure, fires on success with optional data
    ///   - failure: closure, fires on failure with error
    func sendRequest(request: APIRequest, success: @escaping (Data?) -> Void, failure: @escaping (Error?) -> Void) {
        guard var url = URL(string: baseURL + request.path) else {
            failure(nil)
            return
        }

        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        components.queryItems = request.parameters?.compactMap { URLQueryItem(name: $0.key, value: $0.value) }
        if let urlWithParams = components.url {
            url = urlWithParams
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method.rawValue

        let task = session.dataTask(
            with: urlRequest,
            completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
                DispatchQueue.main.async {
                    guard error == nil else {
                        failure(error)
                        return
                    }
                    success(data)
                }
            }
        )
        task.resume()
    }

    /// Sends request and decodes a Decodable model.
    /// If decoding is successful, success closure is called with this method. Otherwise, failure closure is called.
    func sendRequestAndDecode<T: Decodable>(
        request: APIRequest,
        success: @escaping (T) -> Void,
        failure: @escaping (Error?) -> Void
    ) {
        sendRequest(
            request: request,
            success: { data in
                guard let data = data else {
                    failure(APIError("Data was nil!"))
                    return
                }

                do {
                    let model = try JSONDecoder().decode(T.self, from: data)
                    success(model)
                } catch {
                    failure(error)
                }
            },
            failure: failure
        )
    }

    func getUrlContent(urlString: String, completion: @escaping (String?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion("")
            return
        }
        var string = ""
        let task = session.dataTask(with: url) { data, _, _ in
            if let str = String(data: data!, encoding: String.Encoding.utf8) {
                string = str
            }
            completion(string)
        }
        task.resume()
    }
}
