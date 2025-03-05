//
//  GetCharacterDetailsRepository.swift
//  DragonBallApp
//
//  Created by fabian zarate on 04/03/2025.
//

import Foundation

class GetCharacterDetailsRepository: GetCharacterDetailsRepositoryType {
    private let serviceLayer: ServiceLayerType
    
    init(serviceLayer: ServiceLayerType) {
        self.serviceLayer = serviceLayer
    }
    
    func getCharacterDetails(id: Int) async throws(NetworkError) -> Character {
        let request = RequestModel(
            endpoint: .characters ,
            id: String(id)
        )
        do {
            let response = try await serviceLayer.callService(request, Character.self)
            return response
        } catch {
            throw error
        }
    }
}
