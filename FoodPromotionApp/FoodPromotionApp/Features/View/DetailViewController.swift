//
//  DetailViewController.swift
//  FoodPromotionApp
//
//  Created by Mehmet Özkan on 9.10.2023.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    var categoryModel : CategoryModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = categoryModel?.strCategory
        let url = URL(string: categoryModel?.strCategoryThumb ?? "istanbul")
        categoryImageView.kf.setImage(with: url)
        

    }
}
