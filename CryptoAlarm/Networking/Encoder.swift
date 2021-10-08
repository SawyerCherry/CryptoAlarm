//
//  Encoder.swift
//  CryptoAlarm
//
//  Created by Sawyer Cherry on 9/30/21.
//

import Foundation


public struct Encoder {

    static func encodeParameters(for urlRequest: inout URLRequest, with parameters: [String: Any]) {
        guard let url = urlRequest.url else { return }

        if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false), !parameters.isEmpty {
            urlComponents.queryItems = [URLQueryItem]()
            for (key,value) in parameters {
                let queryItem = URLQueryItem(name: key, value: "\(value)")
                urlComponents.queryItems?.append(queryItem)
            }
            urlRequest.url = urlComponents.url
        }
    }

    static func setHeaders(for urlRequest: inout URLRequest, with headers: [String: String]) {
        for (key, value) in headers {
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
    }
}
