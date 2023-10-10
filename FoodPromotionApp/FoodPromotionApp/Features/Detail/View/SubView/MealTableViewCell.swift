//
//  MealTableViewCell.swift
//  FoodPromotionApp
//
//  Created by Mehmet Özkan on 10.10.2023.
//

import UIKit

class MealTableViewCell: UITableViewCell {

    @IBOutlet weak var mealDescriptionLabel: UILabel!
    @IBOutlet weak var mealNameLabel: UILabel!
    
    @IBOutlet weak var mealimageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        selectionStyle = .none

    }
    
}
