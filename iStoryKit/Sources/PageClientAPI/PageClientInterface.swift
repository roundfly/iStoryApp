//
//  PageClientInterface.swift
//  
//
//  Created by Nikola Stojanovic on 21.7.21..
//

import Foundation
import NetworkClientAPI

public struct Page {
    public let id: UUID

    public init(id: UUID) {
        self.id = id
    }
}

public protocol PageClientService {
    var load: () -> Page { get }
    var save: (_ page: Page) -> Void { get }
    var networkClient: NetworkClientService { get }
}
