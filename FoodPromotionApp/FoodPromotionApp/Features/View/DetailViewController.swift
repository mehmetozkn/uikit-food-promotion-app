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
    
    var receivedData: String?
    var imageUrl: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = receivedData
        let url = URL(string: imageUrl ?? "istanbul")
        categoryImageView.kf.setImage(with: url)
        

    }
}
