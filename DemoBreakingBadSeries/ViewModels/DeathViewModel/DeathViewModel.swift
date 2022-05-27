//
//  DeathViewModel.swift
//  DemoBreakingBadSeries
//
//  Created by PCQ229 on 26/05/22.
//

import Foundation

final class DeathViewModel {
    
    private let controller: DeathViewController
    
    // MARK: - Methods
    init(_ viewController: DeathViewController) {
        controller = viewController
    }
}

extension DeathViewModel{
    func callDeathsApi(){
        controller.startLoading()
        DeathController.shared.getDeathList { response in
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
