//
//  CharacterListRepositoryType.swift
//  DragonBallApp
//
//  Created by fabian zarate on 02/03/2025.
//

import Foundation

protocol CharacterListRepositoryType {
    func getCharactersList() async throws(NetworkError) -> CharacterResponse
}
