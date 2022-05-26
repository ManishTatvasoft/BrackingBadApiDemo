//
//  UICollectionView+Extensions.swift
//  Storekeeper
//
//  Created by PCQ183 on 22/06/21.
//

import UIKit
extension UICollectionViewCell: Reusable {}
extension UICollectionView {
    /// Registers a `UICollectionViewCell` using it's own `reuseIdentifier`. The `UICollectionViewCell` must be created using
    /// a `.xib` file with the same name, otherwise it will crash.
    func register<Cell: UICollectionViewCell>(_: Cell.Type) {
        self.register(Cell.nib, forCellWithReuseIdentifier: Cell.reuseIdentifier)
    }
    
    /// Dequeues a `UICollectionViewCell` and casts it to the expected type at the call site.
    func dequeueReusableCell<Cell: UICollectionViewCell>(for indexPath: IndexPath) -> Cell {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: Cell.reuseIdentifier, for: indexPath) as? Cell else {
            fatalError("Unable to dequeue a \(String(describing: Cell.self)) cell.")
        }
        return cell
    }
}
