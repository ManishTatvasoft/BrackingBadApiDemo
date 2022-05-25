//
//  MainNavigator.swift
//  DemoBreakingBadSeries
//
//  Created by PCQ229 on 25/05/22.
//

import UIKit
final class MainNavigator {
    
    // MARK: - Variables
    private let controller: MainViewController
    
    // MARK: - Methods
    init(_ viewController: MainViewController) {
        controller = viewController
    }
}

extension MainNavigator{
    
    func moveToCharecterListScreen(){
        let vc = UIStoryboard.charecterList.get(CharacterListViewController.self)!
        self.controller.navigationController?.pushViewController(vc, animated: true)
    }
    
}
