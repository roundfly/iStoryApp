//
//  RootComponent.swift
//  Onboarding
//
//  Created by Nikola Stojanovic on 24.7.21..
//

import Foundation
import UIKit
import NeedleFoundation

public final class RootComponent: BootstrapComponent {

    var bundle: Bundle
    var splashDuration: TimeInterval

    internal init(splashDuration: TimeInterval, bundle: Bundle) {
        self.bundle = bundle
        self.splashDuration = splashDuration
        super.init()
    }

    public var splashViewController: UIViewController {
        splashScreenChildComponent.rootViewController
    }

    public var onboardingViewController: UIViewController {
        onboardingChildComponent.rootViewController
    }

    private var onboardingChildComponent: OnboardingComponent {
        OnboardingComponent(parent: self)
    }

    private var splashScreenChildComponent: SplashScreenComponent {
        SplashScreenComponent(parent: self)
    }
}
