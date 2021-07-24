//
//  OnboardingBootstrap.swift
//  Onboarding
//
//  Created by Nikola Stojanovic on 24.7.21..
//

import Foundation

/// Module entry point, invoke this procedure to access the root object of Onboarding framework
/// - Parameters:
///   - splashDuration: Duration of the splash screen
///   - bundle: Instance of the bundle from which images are queried
/// - Returns: Root object of the Onboarding module
public func bootstrap(splashDuration: TimeInterval, bundle: Bundle) -> RootComponent {
    registerProviderFactories()
    return RootComponent(splashDuration: splashDuration, bundle: bundle)
}
