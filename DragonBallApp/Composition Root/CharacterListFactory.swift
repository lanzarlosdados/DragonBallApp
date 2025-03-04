//
//  CharacterListFactory.swift
//  DragonBallApp
//
//  Created by fabian zarate on 03/03/2025.
//

import Foundation

@MainActor
class CharacterListFactory {
    
    static func create() -> CharacterListView {
        return CharacterListView(viewModel: createViewModel())
    }
    
    private static func createViewModel() -> CharacterListViewModel {
        return CharacterListViewModel(getCharacterList: createUseCase())
    }
    
    private static func createUseCase() -> GetCharacterListType {
        return GetCharacterList(repository: createRepository())
    }
    
    private static func createRepository() -> CharacterListRepositoryType {
        return CharacterListRepository(
            serviceLayer: ServiceLayerTypeManager.shared.create()
        )
    }
}
