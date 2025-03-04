//
//  ServiceLayerTypeManager.swift
//  DragonBallApp
//
//  Created by fabian zarate on 03/03/2025.
//

import Foundation

@MainActor
class ServiceLayerTypeManager {
    static let shared = ServiceLayerTypeManager()
    
    private init() {}
    
    func create() -> ServiceLayerType {
        return ServiceLayer()
    }
}
