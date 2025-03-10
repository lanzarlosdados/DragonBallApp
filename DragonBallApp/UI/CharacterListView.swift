//
//  CharacterListView.swift
//  DragonBallApp
//
//  Created by fabian zarate on 03/03/2025.
//

import SwiftUI

struct CharacterListView: View {
    @ObservedObject private var viewModel: CharacterListViewModel
    private let characterDetailsFactory: CharacterDetailsFactoryType
    
    init(viewModel: CharacterListViewModel,characterDetailsFactory: CharacterDetailsFactory) {
        self.viewModel = viewModel
        self.characterDetailsFactory = characterDetailsFactory
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .center, spacing: 0) {
                    Spacer(minLength: (UIScreen.main.bounds.width - 350) / 2)
                    
                    ForEach(viewModel.characterList) { character in
                        GeometryReader { geometry in
                            CharacterView(character: character)
                                .frame(width: geometry.size.width-48, height: geometry.size.height)
                        }
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                    }
                    
                    Spacer(minLength: (UIScreen.main.bounds.width - 350) / 2)
                }
            }
            .background(
                Image("nameko")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            )
            .stateView(viewModel.state, retryAction: {
                viewModel.onAppear()
            })
        }
        .onAppear {
            viewModel.onAppear()
        }
    }
}

#Preview {
    CharacterListFactory.create()
}
