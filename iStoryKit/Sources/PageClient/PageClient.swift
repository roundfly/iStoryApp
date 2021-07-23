//
//  PageClient.swift
//  
//
//  Created by Nikola Stojanovic on 21.7.21..
//

import PageClientAPI
import NetworkClientAPI

struct PageClient: PageClientService {
    var load: () -> Page { fatalError() }

    var save: (Page) -> Void { fatalError() }

    var networkClient: NetworkClientService { fatalError() }
}
