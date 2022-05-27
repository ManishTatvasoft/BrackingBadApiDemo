//
//  QuotesCell.swift
//  DemoBreakingBadSeries
//
//  Created by PCQ229 on 27/05/22.
//

import UIKit

class QuotesCell: UITableViewCell {

    @IBOutlet weak var quoteIdLabe: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupData(_ data: QuotesModel){
        quoteIdLabe.text = "Qoute No. : \(data.quote_id ?? 0)"
        quoteLabel.text = "Quote: " + (data.quote ?? "")
        authorLabel.text = "Author: " + (data.author ?? "")
    }
    
}
