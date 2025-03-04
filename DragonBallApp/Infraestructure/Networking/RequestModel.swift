//
//  RequestModel.swift
//  RickyAndMorty
//
//  Created by fabian zarate on 12/07/2023.
//

import Foundation

struct RequestModel  {
    let endpoint : Endpoints
    var id : String = "" 
    var queryItems : [String:String]?
    let httpMethod : HttpMethod = .GET
    var baseUrl : URLBase = .dragonBall
    
    func getURL() -> String{
        return baseUrl.rawValue + endpoint.rawValue + id
    }
    
    enum HttpMethod : String{
        case GET
        case POST
    }

    enum Endpoints : String   {
        case characters = "/characters"
    }

    enum URLBase : String{
        case dragonBall = "https://dragonball-api.com/api"
    }
}
