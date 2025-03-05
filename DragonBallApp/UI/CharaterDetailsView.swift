//
//  CharaterDetailsView.swift
//  DragonBallApp
//
//  Created by fabian zarate on 04/03/2025.
//

import SwiftUI

struct CharaterDetailsView: View {
    @ObservedObject private var viewModel: CharaterDetailsViewModel
    
    init(viewModel: CharaterDetailsViewModel) {
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
                    if let character = viewModel.character {
                        VStack {
                            
                            Text("Nombre")
                                .font(.system(size: 24, weight: .bold))
                            Text(character.name)

                            if let originPlanet = character.originPlanet {
                                Text("Planeta de Origen")
                                    .font(.system(size: 24, weight: .bold))
                                Text(originPlanet.name)
                            }

                            if let transformations = character.transformations,
                               !transformations.isEmpty {
                                Text("Transformacion")
                                    .font(.system(size: 24, weight: .bold))
                                ForEach (transformations, id: \.id) { transformation in
                                    Text(transformation.name)
                                }
                            }
                        }
                    } else {
                        Text("No Character Found")
                        
                    }
                }
            }
        }.onAppear {
            viewModel.onAppear()
        }
    }
}
