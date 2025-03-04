//
//  GetCharacterDetails.swift
//  DragonBallApp
//
//  Created by fabian zarate on 04/03/2025.
//

import Foundation

protocol GetCharacterDetailsType {
    func execute(id: Int) async throws(NetworkError) -> [Character]
}

class GetCharacterDetails {
    let repository: GetCharacterDetailsRepositoryType
    
    init(repository: GetCharacterDetailsRepositoryType) {
        self.repository = repository
    }
    
    func execute(id: Int) async throws(NetworkError) -> [Character] {
        do {
            return try await repository.getCharacterDetails(id: id)
        } catch {
            throw error
        }
    }
}
