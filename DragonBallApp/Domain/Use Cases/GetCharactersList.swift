//
//  GetCharactersList.swift
//  DragonBallApp
//
//  Created by fabian zarate on 02/03/2025.
//

import Foundation

protocol GetCharacterListType {
    func execute() async throws(NetworkError) -> [Character]
}
    
class GetCharacterList: GetCharacterListType {
    private let repository: CharacterListRepositoryType
    
    init(repository: CharacterListRepositoryType) {
        self.repository = repository
    }
    
    func execute() async throws(NetworkError) -> [Character] {
        do {
            let result = try await self.repository.getCharactersList()
            return result.items
        } catch {
            throw error
        }
    }
}
