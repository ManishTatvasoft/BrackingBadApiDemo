//
//  CharacterViewModel.swift
//  DemoBreakingBadSeries
//
//  Created by PCQ229 on 25/05/22.
//

import Foundation

final class CharacterViewModel {
    
    private let controller: CharacterListViewController
    
    // MARK: - Methods
    init(_ viewController: CharacterListViewController) {
        controller = viewController
    }
}

extension CharacterViewModel{
    func callCharacterApi(){
        controller.startLoading()
        CharacterController.shared.getCharacterList { response in
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
