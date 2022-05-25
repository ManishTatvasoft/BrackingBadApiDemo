//
//  Router.swift
//  DemoBreakingBadSeries
//
//  Created by PCQ229 on 25/05/22.
//

import Foundation

public typealias Parameters = [String: Any]
protocol Routable{
    associatedtype T
    
    var path : String { get }
    var method : String { get }
}

enum Router{
    typealias T = Codable.Type
    case main
    case characters
    case episodes
    case quotes
    case deaths
}

extension Router: Routable{
    var path: String {
        switch self {
        case .main:
            return Environment.APIBasePath()
        case .characters:
            return Environment.APIBasePath() + "characters"
        case .episodes:
            return Environment.APIBasePath() + "episodes"
        case .quotes:
            return Environment.APIBasePath() + "quotes"
        case .deaths:
            return Environment.APIBasePath() + "deaths"
        }
    }
    
    var method: String {
        switch self {
        case .main,.characters, .episodes, .quotes, .deaths:
            return "GET"
        }
    }
    
}
