//
//  CharacterListView.swift
//  DragonBallApp
//
//  Created by fabian zarate on 03/03/2025.
//

import SwiftUI

struct CharacterListView: View {
    @ObservedObject private var viewModel: CharacterListViewModel
    
    init(viewModel: CharacterListViewModel) {
        self.viewModel = viewModel
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
                    List {
                        ForEach(viewModel.characterList, id: \.id) { value in
                            Text(value.name)
                        }
                    }
                }
            }
        }.onAppear {
            viewModel.onAppear()
        }
    }
}
