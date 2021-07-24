//
//  OnboardingView.swift
//  Onboarding
//
//  Created by Nikola Stojanovic on 24.7.21..
//

import Foundation
import SwiftUI

struct OnboardingView: View {
    let viewModel: OnboardingViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            ForEach(viewModel.content, id: \.self) { (image) in
                Image(systemName: image)
            }
        }
    }
}
