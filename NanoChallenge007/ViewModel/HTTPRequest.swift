//
//  HTTPRequest.swift
//  api.workshop
//
//  Created by Matheus Cavalcanti de Arruda on 05/01/23.
//

import Foundation

public enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}

public class HTTPRequestBuilder {
    
    private var path: String
    private var method: HTTPMethod
    private var parameters: [String:Any] = [:]
    private var headers: [String:Any] = [:]
    private var timeoutInterval: Double
    private var body: Data?
    
    public init() {
        self.path = ""
        self.method = .GET
        self.timeoutInterval = 5
    }
    
    public func path(_ path: String) -> HTTPRequestBuilder {
        self.path = path
        return self
    }
    
    public func method(_ method: HTTPMethod) -> HTTPRequestBuilder {
        self.method = method
        return self
    }
    
    public func addParameter(key: String, value: Any) -> HTTPRequestBuilder {
        self.parameters[key] = value
        return self
    }
    
    public func addHeader(key: String, value: Any) -> HTTPRequestBuilder {
        self.headers[key] = value
        return self
    }
    
    public func timeoutInterval(_ time: Double) -> HTTPRequestBuilder {
        self.timeoutInterval = time
        return self
    }
    
    public func body(_ body: Data) -> HTTPRequestBuilder {
        self.body = body
        return self
    }
    
    private func buildURL() throws -> URL {
        var fullDomain: String = "\(path)"
        
        if !self.parameters.isEmpty {
            fullDomain += buildParameters()
        }
        
        guard let url: URL = URL(string: fullDomain) else {
            throw URLError(.badURL)
        }
        
        return url
    }
    
    private func buildParameters() -> String {
        var params: String = ""
        
        for key in self.parameters.keys {
            params += (params.isEmpty) ? "?\(key)=\(parameters[key]!)" : "&\(key)=\(parameters[key]!)"
        }
        
        return params
    }
    
    public func build() throws -> HTTPRequest {
        let url: URL = try buildURL()
        var request: URLRequest = URLRequest(url: url)
        
        request.httpMethod = self.method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        if !self.headers.isEmpty {
            for key in self.headers.keys {
                request.addValue("\(self.headers[key]!)", forHTTPHeaderField: key)
            }
        }
        
        if let body = self.body {
            request.httpBody = body
        }
        
        let timeoutInterval = TimeInterval(self.timeoutInterval)
        request.timeoutInterval = timeoutInterval
        
        return HTTPRequest(request)
    }
}

public class HTTPRequest {
    
    private let request: URLRequest
    
    public init(_ request: URLRequest) {
        self.request = request
    }
    
    public static func builder() -> HTTPRequestBuilder {
        return HTTPRequestBuilder()
    }
    
    public func send() async throws -> (Data, HTTPURLResponse) {
        print("Request made to: \(self.request.url?.absoluteString ?? "")")
        
        let sendRequest = Task { () -> (Data, HTTPURLResponse) in
            let (data, urlResponse) =  try await URLSession.shared.data(for: self.request)
            let httpUrlResponse = urlResponse as! HTTPURLResponse
            return (data, httpUrlResponse)
        }
        
        return try await sendRequest.value
    }
}
