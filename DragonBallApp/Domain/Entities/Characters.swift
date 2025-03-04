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
    let originPlanet: OriginPlanet?
    let transformations: [Transformation]?

    enum CodingKeys: String, CodingKey {
        case id, name, ki, maxKi, race, gender, description, image, affiliation, deletedAt, originPlanet, transformations
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        ki = try container.decode(String.self, forKey: .ki)
        maxKi = try container.decode(String.self, forKey: .maxKi)
        race = try container.decode(String.self, forKey: .race)
        gender = try container.decode(String.self, forKey: .gender)
        description = try container.decode(String.self, forKey: .description)
        image = try container.decode(String.self, forKey: .image)
        affiliation = try container.decode(String.self, forKey: .affiliation)
        deletedAt = try container.decodeIfPresent(String.self, forKey: .deletedAt)
        originPlanet = try container.decodeIfPresent(OriginPlanet.self, forKey: .originPlanet)
        transformations = try container.decodeIfPresent([Transformation].self, forKey: .transformations)
    }
}

struct CharacterResponse: Codable {
    let items: [Character]
}
