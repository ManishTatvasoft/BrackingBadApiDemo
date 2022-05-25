//
//  MainController.swift
//  DemoBreakingBadSeries
//
//  Created by PCQ229 on 25/05/22.
//

import Foundation


final class MainController {
    
    static let shared = MainController()
    
    func getMainDataList(successCompletion: @escaping (_ response: MainModel) -> Void,
    failureCompletion: @escaping ( _ failure: WebError, _ errorMessage: String) -> Void){
        APIManager.API.sendRequest(.main, type: MainModel.self, successCompletion: successCompletion, failureCompletion: failureCompletion)
    }
}
