//
//  SplashScreenView.swift
//  Onboarding
//
//  Created by Nikola Stojanovic on 24.7.21..
//

import Foundation
import SwiftUI

struct SplashScreenView: View {

    let viewModel: SplashScreenViewModel
    @State var isAnimating = false

    var body: some View {
        Text("Splash")
            .padding()
            .background(Color.red)
            .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
            .scaleEffect(isAnimating ? 2 : 1)
            .animation(.easeInOut(duration: viewModel.animationDuration))
            .onAppear {
                isAnimating.toggle()
            }
    }
}
