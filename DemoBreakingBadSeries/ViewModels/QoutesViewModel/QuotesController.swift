//
//  QuotesController.swift
//  DemoBreakingBadSeries
//
//  Created by PCQ229 on 26/05/22.
//

import Foundation

final class QuotesController {
    
    static let shared = QuotesController()
    
    func getQuotesList(successCompletion: @escaping (_ response: [QuotesModel]) -> Void,
    failureCompletion: @escaping ( _ failure: WebError, _ errorMessage: String) -> Void){
        APIManager.API.sendRequest(.quotes, type: [QuotesModel].self, successCompletion: successCompletion, failureCompletion: failureCompletion)
    }
}
