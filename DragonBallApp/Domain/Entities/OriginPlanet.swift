//
//  OriginPlanet.swift
//  DragonBallApp
//
//  Created by fabian zarate on 04/03/2025.
//

import Foundation

struct OriginPlanet: Codable {
    let id: Int
    let name: String
    let isDestroyed: Bool
    let description: String
    let image: String
    let deletedAt: String?
}
