//
//  StoryClient.swift
//  
//
//  Created by Nikola Stojanovic on 21.7.21..
//

import StoryClientAPI
import PageClientAPI

struct StoryClient: StoryClientService {
    var load: () -> Story { fatalError() }

    var save: (Story) -> Void { fatalError() }

    var pageClient: PageClientService { fatalError() }
}
