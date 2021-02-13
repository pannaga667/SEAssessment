//
//  AppHomeTableViewCell.swift
//  Assess
//
//  Created by Pannaga Bhushana on 13/02/21.
//

import UIKit
import SDWebImage

class AppHomeTableViewCell: UITableViewCell {

    @IBOutlet weak var backGroundImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(data: Photo){
        if let imageUrl = data.src?.small {
            backGroundImageView.downloaded(from: imageUrl)
        }
        
        self.profileNameLabel.text = data.photographer
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
