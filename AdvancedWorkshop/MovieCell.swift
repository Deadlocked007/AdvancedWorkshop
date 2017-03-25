
//
//  MovieCell.swift
//  AdvancedWorkshop
//
//  Created by Siraj Zaneer on 3/24/17.
//  Copyright © 2017 sirajzaneer.com. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var posterView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
