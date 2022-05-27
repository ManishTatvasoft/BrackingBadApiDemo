//
//  UIStoryboard+Extension.swift
//  DemoBreakingBadSeries
//
//  Created by PCQ229 on 25/05/22.
//

import UIKit

extension UIStoryboard {
    static var main: UIStoryboard = {
        let storyboard = UIStoryboard.storyboard(name: "Main")
        return storyboard
    }()
    static var charecterList: UIStoryboard = {
        let storyboard = UIStoryboard.storyboard(name: "CharecterList")
        return storyboard
    }()
    
    static var episodes: UIStoryboard = {
        let storyboard = UIStoryboard.storyboard(name: "Episodes")
        return storyboard
    }()
    static var quotes: UIStoryboard = {
        let storyboard = UIStoryboard.storyboard(name: "Quotes")
        return storyboard
    }()
    
    static var death: UIStoryboard = {
        let storyboard = UIStoryboard.storyboard(name: "Death")
        return storyboard
    }()
    
    // to get particular storyboard name.
    class func storyboard(name: String) -> UIStoryboard {
        return UIStoryboard(name: name, bundle: Bundle.main)
    }
    
    public func get<T:UIViewController>(_ identifier: T.Type) -> T? {
        let storyboardID = String(describing: identifier)

        guard let viewController = instantiateViewController(withIdentifier: storyboardID) as? T else {
            return nil
        }

        return viewController
    }
}
