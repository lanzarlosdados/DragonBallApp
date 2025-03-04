//
//  CharacterListRepository.swift
//  DragonBallApp
//
//  Created by fabian zarate on 02/03/2025.
//

import Foundation

class CharacterListRepository: CharacterListRepositoryType {
    let serviceLayer : ServiceLayerType
    
    init( serviceLayer: ServiceLayerType) {
        self.serviceLayer = serviceLayer
    }
    
    func getCharactersList() async throws(NetworkError) -> CharacterResponse {
        let request = RequestModel(endpoint: .characters)
        do {
            return try await serviceLayer.callService(request, CharacterResponse.self )
        } catch {
            throw error
        }
    }
}
