//
//  SceneDelegate.swift
//  iStoryApp
//
//  Created by Nikola Stojanovic on 20.7.21..
//

import UIKit
import AnalyticsClient
import Onboarding

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)

        let splashDuration: TimeInterval = 2 // instead of hardcoding a magic number, provide value from the design system
        let bundle: Bundle = .main // instead of .main provide bundle of design system since in it resources will be placed

        let root = Onboarding.bootstrap(splashDuration: splashDuration, bundle: bundle)
        window?.rootViewController = root.splashViewController
        window?.makeKeyAndVisible()
    }
}
