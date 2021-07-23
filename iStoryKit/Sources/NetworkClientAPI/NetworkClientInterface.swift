//
//  NetworkClientInterface.swift
//  
//
//  Created by Nikola Stojanovic on 20.7.21..
//

import Foundation
import Combine

public struct NetworkRequest {
    var url: URL
}

public protocol NetworkClientService {

    func perform<T: Codable>(_ request: NetworkRequest) -> AnyPublisher<T, Error>
}

