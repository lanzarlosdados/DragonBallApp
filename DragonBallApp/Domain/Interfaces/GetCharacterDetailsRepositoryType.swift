//
//  GetCharacterDetailsRepositoryType.swift
//  DragonBallApp
//
//  Created by fabian zarate on 04/03/2025.
//

import Foundation

protocol GetCharacterDetailsRepositoryType {
    func getCharacterDetails(id: Int) async throws(NetworkError) -> [Character]
}
