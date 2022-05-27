//
//  QuotesViewModel.swift
//  DemoBreakingBadSeries
//
//  Created by PCQ229 on 26/05/22.
//

import Foundation
final class QuotesViewModel {
    
    private let controller: QuotesViewController
    
    // MARK: - Methods
    init(_ viewController: QuotesViewController) {
        controller = viewController
    }
}

extension QuotesViewModel{
    func callQoutesApi(){
        controller.startLoading()
        QuotesController.shared.getQuotesList { response in
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
