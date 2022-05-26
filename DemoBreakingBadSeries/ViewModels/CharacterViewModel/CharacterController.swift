//
//  CharacterController.swift
//  DemoBreakingBadSeries
//
//  Created by PCQ229 on 25/05/22.
//

import Foundation
final class CharacterController {
    
    static let shared = CharacterController()
    
    func getCharacterList(successCompletion: @escaping (_ response: [CharacterModel]) -> Void,
    failureCompletion: @escaping ( _ failure: WebError, _ errorMessage: String) -> Void){
        APIManager.API.sendRequest(.characters, type: [CharacterModel].self, successCompletion: successCompletion, failureCompletion: failureCompletion)
    }
}
