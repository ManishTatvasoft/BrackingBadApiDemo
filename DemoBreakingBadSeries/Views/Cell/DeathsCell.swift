//
//  DeathsCell.swift
//  DemoBreakingBadSeries
//
//  Created by PCQ229 on 27/05/22.
//

import UIKit

class DeathsCell: UITableViewCell {

    @IBOutlet weak var deathNameLabel: UILabel!
    @IBOutlet weak var deathCauseLabel: UILabel!
    @IBOutlet weak var reasponsibleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setupData(_ data: DeathModel){
        DispatchQueue.main.async {
            self.contentView.layer.shadowOffset = CGSize(width: 0, height: 0)
            self.contentView.layer.shadowOpacity = 0.3
            self.contentView.layer.shadowRadius = 3
        }
        deathNameLabel.text = data.death
        deathCauseLabel.text = data.cause
        reasponsibleLabel.text = data.responsible
    }
}
