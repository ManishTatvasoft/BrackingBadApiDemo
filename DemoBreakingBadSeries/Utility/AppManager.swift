//
//  AppManager.swift
//  DemoBreakingBadSeries
//
//  Created by PCQ229 on 25/05/22.
//

import UIKit

class AppManager{
    static let shared = AppManager()
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var timer: Timer?
    var reachability : Reachability?
    
    func prepareNavigation() {
        AppManager.appDelegate.initialViewController = UIStoryboard.main.get(MainViewController.self)!
        AppManager.appDelegate.customNavigationController = UINavigationController(rootViewController: AppManager.appDelegate.initialViewController)
        AppManager.appDelegate.window?.rootViewController = AppManager.appDelegate.customNavigationController
        AppManager.appDelegate.window?.makeKeyAndVisible()
//        AppManager.appDelegate.customNavigationController.setNavigationBarHidden(true, animated: true)
    }

    
}
