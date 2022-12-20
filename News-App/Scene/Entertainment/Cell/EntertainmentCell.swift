//
//  EntertainmentCell.swift
//  News-App
//
//  Created by Erdal Keser on 14.12.2022.
//

import UIKit

class EntertainmentCell: UITableViewCell {
    @IBOutlet weak var entertainmentTitleLabel: UILabel!
    @IBOutlet weak var entertainmentImageView: UIImageView!
    @IBOutlet weak var entertainmentDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
