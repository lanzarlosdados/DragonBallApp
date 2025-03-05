//
//  ServiceLayerTypeManager.swift
//  DragonBallApp
//
//  Created by fabian zarate on 03/03/2025.
//

import Foundation

@MainActor
class ServiceLayerManager {
    static let shared = ServiceLayerManager()
    
    private init() {}
    
    func create() -> ServiceLayerType {
        return ServiceLayer()
    }
}
