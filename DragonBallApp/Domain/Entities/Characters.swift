//
//  Characters.swift
//  DragonBallApp
//
//  Created by fabian zarate on 02/03/2025.
//

import Foundation

struct Character: Codable {
    let id: Int
    let name: String
    let ki: String
    let maxKi: String
    let race: String
    let gender: String
    let description: String
    let image: String
    let affiliation: String
    let deletedAt: String?
}

struct CharacterResponse: Codable {
    let items: [Character]
}
