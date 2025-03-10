//
//  CharaterDetailsFactory.swift
//  DragonBallApp
//
//  Created by fabian zarate on 04/03/2025.
//

import Foundation

@MainActor
protocol CharacterDetailsFactoryType {
    func create(id: Int) -> CharaterDetailsView
}

class CharacterDetailsFactory: CharacterDetailsFactoryType {
    
    func create(id: Int) -> CharaterDetailsView {
        return CharaterDetailsView(viewModel: createViewModel(id: id))
    }
    
    private func createViewModel(id: Int) -> CharacterDetailsViewModel {
        return CharacterDetailsViewModel(getCharacterDetails: createUseCase(), charaterId: id)
    }
    
    private func createUseCase() -> GetCharacterDetailsType {
        return GetCharacterDetails(repository: createRepository())
    }
    
    private func createRepository() -> GetCharacterDetailsRepositoryType {
        let serviceLayer = ServiceLayerManager.shared.create()
        return GetCharacterDetailsRepository(serviceLayer: serviceLayer)
    }
}
