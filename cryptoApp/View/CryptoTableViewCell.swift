//
//  CryptoTableViewCell.swift
//  cryptoApp
//
//  Created by Berkay on 31.10.2022.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {

    @IBOutlet weak var nameOfText: UILabel!
    @IBOutlet weak var valueOfText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
