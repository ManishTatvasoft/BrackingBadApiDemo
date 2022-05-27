//
//  DeathController.swift
//  DemoBreakingBadSeries
//
//  Created by PCQ229 on 26/05/22.
//

import Foundation

final class DeathController {
    
    static let shared = DeathController()
    
    func getDeathList(successCompletion: @escaping (_ response: [DeathModel]) -> Void,
    failureCompletion: @escaping ( _ failure: WebError, _ errorMessage: String) -> Void){
        APIManager.API.sendRequest(.deaths, type: [DeathModel].self, successCompletion: successCompletion, failureCompletion: failureCompletion)
    }
}
