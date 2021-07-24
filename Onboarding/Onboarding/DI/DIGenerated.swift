

import Foundation
import NeedleFoundation
import SwiftUI
import UIKit

// swiftlint:disable unused_declaration
private let needleDependenciesHash : String? = nil

// MARK: - Registration

public func registerProviderFactories() {
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->OnboardingComponent") { component in
        return OnboardingDependenciesc2e150944dc3c9e77b26Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent->SplashScreenComponent") { component in
        return SplashScreenDependencies5890cf0464f5061bc7f4Provider(component: component)
    }
    __DependencyProviderRegistry.instance.registerDependencyProviderFactory(for: "^->RootComponent") { component in
        return EmptyDependencyProvider(component: component)
    }
    
}

// MARK: - Providers

private class OnboardingDependenciesc2e150944dc3c9e77b26BaseProvider: OnboardingDependencies {
    var bundle: Bundle {
        return rootComponent.bundle
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->OnboardingComponent
private class OnboardingDependenciesc2e150944dc3c9e77b26Provider: OnboardingDependenciesc2e150944dc3c9e77b26BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(rootComponent: component.parent as! RootComponent)
    }
}
private class SplashScreenDependencies5890cf0464f5061bc7f4BaseProvider: SplashScreenDependencies {
    var splashDuration: TimeInterval {
        return rootComponent.splashDuration
    }
    private let rootComponent: RootComponent
    init(rootComponent: RootComponent) {
        self.rootComponent = rootComponent
    }
}
/// ^->RootComponent->SplashScreenComponent
private class SplashScreenDependencies5890cf0464f5061bc7f4Provider: SplashScreenDependencies5890cf0464f5061bc7f4BaseProvider {
    init(component: NeedleFoundation.Scope) {
        super.init(rootComponent: component.parent as! RootComponent)
    }
}
