//
//  EpisodeCell.swift
//  DemoBreakingBadSeries
//
//  Created by PCQ229 on 26/05/22.
//

import UIKit

class EpisodeCell: UITableViewCell {
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var characterButton: UIButton!
    @IBOutlet weak var airDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupData(_ data: EpisodeModel){
        episodeLabel.text = data.episode
        titleLabel.text = data.title
        seasonLabel.text = "Season: " + (data.season ?? "")
        airDateLabel.text = data.air_date
    }
    
}
