//
//  SplashScreenComponent.swift
//  Onboarding
//
//  Created by Nikola Stojanovic on 24.7.21..
//

import Foundation
import NeedleFoundation
import SwiftUI
import UIKit

protocol SplashScreenDependencies: Dependency {
    var splashDuration: TimeInterval { get }
}

final class SplashScreenComponent: Component<SplashScreenDependencies> {

    var rootViewController: UIViewController {
        let viewModel = SplashScreenViewModel(animationDuration: dependency.splashDuration)
        return UIHostingController(rootView: SplashScreenView(viewModel: viewModel))
    }
}
