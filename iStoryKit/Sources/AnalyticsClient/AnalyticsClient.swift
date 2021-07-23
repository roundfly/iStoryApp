//
//  AnalyticsClient.swift
//  
//
//  Created by Nikola Stojanovic on 20.7.21..
//

import AnalyticsClientAPI

struct AnalyticsClient: AnalyticsClientService {
    func track(events: [String : String]) {}
}
