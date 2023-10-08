//
//  CustomTableView.swift
//  FoodPromotionApp
//
//  Created by Mehmet Özkan on 8.10.2023.
//

import UIKit

protocol CustomTableViewProtocol {
    func update(items: [CategoryModel]?)
}

protocol CustomTableViewOutput : AnyObject {
    func onSelected(item: CategoryModel)
}


final class CustomTableView : NSObject {
    
    private lazy var items: [CategoryModel] = []
    
    /// Custom TableView Outpu Models
    weak var delegate: CustomTableViewOutput?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = items[indexPath.row].strCategory
        cell.detailTextLabel?.text = items[indexPath.row].strCategoryDescription
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.onSelected(item: items[indexPath.row])
    }
    
}

extension CustomTableView: UITableViewDelegate, UITableViewDataSource {}
extension CustomTableView: CustomTableViewProtocol {
    func update(items: [CategoryModel]?) {
        self.items = items ?? []
        
    }
}

