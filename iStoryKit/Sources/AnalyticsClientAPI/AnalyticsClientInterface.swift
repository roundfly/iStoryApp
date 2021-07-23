//
//  AnalyticsClientInterface.swift
//  
//
//  Created by Nikola Stojanovic on 20.7.21..
//

import Foundation

public protocol AnalyticsClientService {
    func track(events: [String: String])
}
