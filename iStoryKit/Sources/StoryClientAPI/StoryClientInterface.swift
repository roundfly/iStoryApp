//
//  StoryClientInterface.swift
//  
//
//  Created by Nikola Stojanovic on 21.7.21..
//

import PageClientAPI

public struct Story {
    public var pages: [Page]
}

public protocol StoryClientService {
    var load: () -> Story { get }
    var save: (_ Story: Story) -> Void { get }
    var pageClient: PageClientService { get }
}
