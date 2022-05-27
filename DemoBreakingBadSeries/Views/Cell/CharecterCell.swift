//
//  CharecterCell.swift
//  DemoBreakingBadSeries
//
//  Created by PCQ229 on 25/05/22.
//

import UIKit

class CharecterCell: UICollectionViewCell {

    @IBOutlet weak var charecterImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    func setupData(_ character: CharacterModel){
        DispatchQueue.main.async {
            self.charecterImage.cornerRadius = self.charecterImage.bounds.size.height / 2
        }
        charecterImage.setImageUsingUrlSession(character.img, placeholder: UIImage(systemName: "person.fill"))
        nameLabel.text = character.name
        dobLabel.text = character.birthday
    }
}
