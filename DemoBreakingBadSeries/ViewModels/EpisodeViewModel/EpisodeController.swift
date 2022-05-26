//
//  EpisodeController.swift
//  DemoBreakingBadSeries
//
//  Created by PCQ229 on 26/05/22.
//

import Foundation

final class EpisodeController {
    
    static let shared = EpisodeController()
    
    func getEpisodeList(successCompletion: @escaping (_ response: [EpisodeModel]) -> Void,
    failureCompletion: @escaping ( _ failure: WebError, _ errorMessage: String) -> Void){
        APIManager.API.sendRequest(.episodes, type: [EpisodeModel].self, successCompletion: successCompletion, failureCompletion: failureCompletion)
    }
}
