//
//  ViewController.swift
//  Authentication
//
//  Created by Nikola Stojanovic on 21.7.21..
//

import Foundation
import UIKit
import AnalyticsClientAPI


final class AuthVC: UIViewController {

    private let analytics: AnalyticsClientService

    init(analytics: AnalyticsClientService) {
        self.analytics = analytics
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
