//
//  MainCell.swift
//  News-App
//
//  Created by Erdal Keser on 14.12.2022.
//

import UIKit

class MainCell: UITableViewCell {
    @IBOutlet weak var mainImageView: UIImageView!
    
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var mainAuthorLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
