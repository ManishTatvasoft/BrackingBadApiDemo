//
//  AppConstant.swift
//  DemoBreakingBadSeries
//
//  Created by PCQ229 on 25/05/22.
//

import Foundation


let ApplicationName         = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ?? "Storekeeper"
let ApplicationVersion      = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as? String ?? ""
let ApplicationBuildNumber  = Bundle.main.infoDictionary!["CFBundleVersion"] as? String ?? ""


extension String {
    
    struct Title {
        static let title                                = ApplicationName
        static let noInternet                           = "You need an active data connection to use this application, please check your internet settings and try again";
        static let internalServerError                  = "Internal Server Error"
        static let invalidUrl                           = "Invalid Url"
        static let jsonparseFail                        = "Json Pars error"
        
        
        
        static let ok                                   = "OK"
    }
}
