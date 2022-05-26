//
//  EpisodeViewModel.swift
//  DemoBreakingBadSeries
//
//  Created by PCQ229 on 26/05/22.
//

import Foundation

final class EpisodeViewModel {
    
    private let controller: EpisodesViewController
    
    // MARK: - Methods
    init(_ viewController: EpisodesViewController) {
        controller = viewController
    }
}

extension EpisodeViewModel{
    func callEpisodeApi(){
        controller.startLoading()
        EpisodeController.shared.getEpisodeList { response in
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
