//
//  SportCell.swift
//  News-App
//
//  Created by Erdal Keser on 14.12.2022.
//

import UIKit

class SportCell: UITableViewCell {
    @IBOutlet weak var sportTitleLabel: UILabel!
    
    @IBOutlet weak var sportImageView: UIImageView!
    @IBOutlet weak var sportDescriptionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
