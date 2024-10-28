//
//  CountryTableViewCell.swift
//  CountryStorage
//
//  Created by Amine Nakhle on 27/10/2024.
//

import UIKit
import SDWebImage

class CountryTableViewCell: UICollectionViewCell {

    @IBOutlet weak var countryImageView: NSLayoutConstraint!
    @IBOutlet weak var countryNameLable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    func setup(country: CountryResult) {
        countryNameLable.text = country.name.common
        
        if let url = URL(string: country.flags.png) {
            countryImageView.sd_setImage(with: url)
        }
    }

}
