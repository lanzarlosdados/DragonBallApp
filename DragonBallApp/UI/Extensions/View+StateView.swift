//
//  View+StateView.swift
//  DragonBallApp
//
//  Created by fabian zarate on 08/03/2025.
//

import SwiftUI

extension View {
    func stateView(_ state: ViewState, retryAction: (() -> Void)? = nil) -> some View {
        self.modifier(StateViewModifier(state: state, retryAction: retryAction))
    }
}

struct StateViewModifier: ViewModifier {
    let state: ViewState
    let retryAction: (() -> Void)?
    
    func body(content: Content) -> some View {
        Group {
            switch state {
            case .loading:
                ProgressView()
                    .progressViewStyle(.circular)
            case .loaded:
                content
            case .error(let message):
                VStack {
                    Text(message)
                        .foregroundColor(.red)
                    if let retryAction = retryAction {
                        Button("Retry", action: retryAction)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }
        }
    }
}
