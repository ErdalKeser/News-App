//
//  TechnologyCell.swift
//  News-App
//
//  Created by Erdal Keser on 14.12.2022.
//

import UIKit

class TechnologyCell: UITableViewCell {
    @IBOutlet weak var technologyTitleLabel: UILabel!

    @IBOutlet weak var technologyImageView: UIImageView!
    
    @IBOutlet weak var technologyDescriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
