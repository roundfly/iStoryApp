//
//  NetworkClient.swift
//  
//
//  Created by Nikola Stojanovic on 20.7.21..
//

import Alamofire
import Combine
import NetworkClientAPI

public struct NetworkClient: NetworkClientService {

    public func perform<T: Codable>(_ request: NetworkRequest) -> AnyPublisher<T, Error> {
        // perform network request with Alamofire
        fatalError()
    }
}
