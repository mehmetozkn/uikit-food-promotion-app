//
//  CustomTableView.swift
//  FoodPromotionApp
//
//  Created by Mehmet Özkan on 8.10.2023.
//

import UIKit

protocol CategoryTableViewProtocol {
    func update(items: [CategoryModel]?)
}

protocol CategoryTableViewOutput : AnyObject {
    func onSelected(item: CategoryModel)
}


final class CategoryTableView : NSObject {
    
    private lazy var items: [CategoryModel] = []
    
    /// Custom TableView Outpu Models
    weak var delegate: CategoryTableViewOutput?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        cell.nameLabel.text = items[indexPath.row].strCategory
        cell.descriptionLabel.text = items[indexPath.row].strCategoryDescription
        let url = URL(string: items[indexPath.row].strCategoryThumb ?? "")
        cell.customİmageView.kf.setImage(with: url)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.screenHeight * 0.1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.onSelected(item: items[indexPath.row])
    }
    
    
}

extension CategoryTableView: UITableViewDelegate, UITableViewDataSource {}
extension CategoryTableView: CategoryTableViewProtocol {
    func update(items: [CategoryModel]?) {
        self.items = items ?? []
        
    }
}

