//
//  OnboardingComponent.swift
//  Onboarding
//
//  Created by Nikola Stojanovic on 24.7.21..
//

import UIKit
import SwiftUI
import NeedleFoundation

protocol OnboardingDependencies: Dependency {
    var bundle: Bundle { get }
}

final class OnboardingComponent: Component<OnboardingDependencies> {

    var rootViewController: UIViewController {
        let viewModel = OnboardingViewModel(bundle: dependency.bundle)
        return UIHostingController(rootView: OnboardingView(viewModel: viewModel))
    }
}
