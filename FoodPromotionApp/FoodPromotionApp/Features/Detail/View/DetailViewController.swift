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
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var categoryModel: CategoryModel?
    private var detailViewModel = DetailViewModel()
    private lazy var results: [MealModel] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDelegate()
        initPageCategoryInfo()
        
        detailViewModel.setDelegate(output: self)
        detailViewModel.fetchItems(category: categoryModel?.strCategory ?? "")
      
    }
    
    func initPageCategoryInfo() {
        
        nameLabel.text = categoryModel?.strCategory
        descriptionLabel.text = categoryModel?.strCategoryDescription
        let url = URL(string: categoryModel?.strCategoryThumb ?? "placeholder")
        categoryImageView.kf.setImage(with: url)
    }
    
    func initDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MealTableViewCell", bundle: nil), forCellReuseIdentifier: "MealTableViewCell")
    }

 }

protocol DetailOutput {
   
    func saveDatas(values: [MealModel])
}

extension DetailViewController : DetailOutput {
   
    func saveDatas(values: [MealModel]) {
        results = values
        tableView.reloadData()
    }
}

extension DetailViewController : UITableViewDelegate, UITableViewDataSource  {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MealTableViewCell", for: indexPath) as! MealTableViewCell
        cell.mealNameLabel.text = results[indexPath.row].strMeal
        let url = URL(string: results[indexPath.row].strMealThumb ?? "")
        cell.mealImageView.kf.setImage(with: url)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UIScreen.screenHeight * 0.1
    }
}
