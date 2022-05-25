//
//  Environment.swift
//  DemoBreakingBadSeries
//
//  Created by PCQ229 on 25/05/22.
//

import Foundation

enum Server {
    case developement
    case staging
    case production
}

class Environment {
    
    static let server:Server    =   .developement
    
    static let buildVersion: String = "1.0.1"

    static let latestBuildVersion: Double = 1.0
    
    class func APIBasePath() -> String {
        switch self.server {
        case .developement:
            return "https://www.breakingbadapi.com/api/"
        case .staging:
            return ""
        case .production:
            return ""
        }
    }
}
