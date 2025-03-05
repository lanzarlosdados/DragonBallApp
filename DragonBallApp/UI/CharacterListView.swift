//
//  CharacterListView.swift
//  DragonBallApp
//
//  Created by fabian zarate on 03/03/2025.
//

import SwiftUI

struct CharacterListView: View {
    @ObservedObject private var viewModel: CharacterListViewModel
    private let charaterDetailsFactory: CharaterDetailsFactoryType
    
    init(viewModel: CharacterListViewModel,charaterDetailsFactory: CharaterDetailsFactory) {
        self.viewModel = viewModel
        self.charaterDetailsFactory = charaterDetailsFactory
    }
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView()
                    .progressViewStyle(.circular)
            } else {
                if let errorMessage =  viewModel.errorMessage,
                   !errorMessage.isEmpty {
                    Text(errorMessage)
                } else {
                    NavigationStack {
                        List {
                            ForEach(viewModel.characterList, id: \.id) { value in
                                NavigationLink{
                                    charaterDetailsFactory.create(id: value.id)
                                } label: {
                                    Text(value.name)
                                }
                            }
                        }

                    }
                }
            }
        }.onAppear {
            viewModel.onAppear()
        }
    }
}
