//
//  SwiftUI+Extensions.swift
//  
//
//  Created by Oleksandr Balabanov on 19/08/2024.
//

import SwiftUI

public extension View {
    @MainActor
    func trackAppearance(
        _ screen: String
    ) -> some View {
        modifier(
            RoutableViewModifier(applicationScreen: screen)
        )
    }
}

/// A routable screen
public struct RoutableViewModifier: ViewModifier {
    private var screen: String
    private var screenID = UUID()

    init(applicationScreen: String) {
        screen = applicationScreen
    }

    public func body(content: Content) -> some View {
        content
            .onAppear {
                NavigationTracker.shared.handleOnAppear(screen, screenID: screenID)
            }
            .onDisappear {
                NavigationTracker.shared.handleOnDisappear(screen, screenID: screenID)
            }
    }
}
