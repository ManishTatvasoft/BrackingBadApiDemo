//
//  MainViewModel.swift
//  DemoBreakingBadSeries
//
//  Created by PCQ229 on 25/05/22.
//

import Foundation

final class MainViewModel {
    
    private let controller: MainViewController
    
    // MARK: - Methods
    init(_ viewController: MainViewController) {
        controller = viewController
    }
}

extension MainViewModel{
    func callMainApi(){
        controller.startLoading()
        MainController.shared.getMainDataList { response in
            self.controller.stopLoading()
            self.controller.successApiResponse(response)
        } failureCompletion: { failure, errorMessage in
            self.controller.stopLoading()
            DispatchQueue.main.async {
                self.controller.showValidationMessage(withMessage: errorMessage)
            }
            
        }

    }
}
