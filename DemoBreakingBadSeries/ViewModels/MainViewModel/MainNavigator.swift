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
    
    func moveToCharecterListScreen(at index: Int){
        switch index{
        case 0:
             print("")
            let vc = UIStoryboard.charecterList.get(CharacterListViewController.self)!
            self.controller.navigationController?.pushViewController(vc, animated: true)
        case 1:
            print("")
            let vc = UIStoryboard.episodes.get(EpisodesViewController.self)!
            self.controller.navigationController?.pushViewController(vc, animated: true)
        case 2:
            print("")
        default:
            print("")
        }
//        let vc = UIStoryboard.charecterList.get(CharacterListViewController.self)!
//        self.controller.navigationController?.pushViewController(vc, animated: true)
    }
    
}
