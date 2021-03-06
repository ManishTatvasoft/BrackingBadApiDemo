//
//  Reusable.swift
//  Storekeeper
//
//  Created by PCQ183 on 22/06/21.
//

import UIKit
/// This protocol only aggregates the needed properties for the extensions to work and avoid duplicated code.
 protocol Reusable: class {
    /// Returns `String(describing: self)` to be used as the `reuseIdentifier`.
    static var reuseIdentifier: String { get }
    /// Returns the UINib using the `String(describing: self)` as the name of the NIB.
    static var nib: UINib { get }
}

 extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}
