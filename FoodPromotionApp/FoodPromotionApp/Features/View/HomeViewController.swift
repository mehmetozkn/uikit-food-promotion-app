//
//  HomeViewController.swift
//  FoodPromotionApp
//
//  Created by Mehmet Özkan on 8.10.2023.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let customTableView = CustomTableView()
    private let homeService = HomeService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDelegate()
        initService()
    }
    
    func initDelegate ()  {
        tableView.delegate = customTableView
        tableView.dataSource = customTableView
        customTableView.delegate = self
    }
    
    func initService () {
        homeService.fetchAllCategories { [weak self] (models) in
            self?.customTableView.update(items: models)
            self?.tableView.reloadData()
            
        } onFail: { (error) in
            print(error ?? "Error")
        }

    }

}

extension HomeViewController: CustomTableViewOutput {
    func onSelected(item: CategoryModel) {
        print(item.idCategory ?? "")
    }
}
