//
//  CategoryModel.swift
//  FoodPromotionApp
//
//  Created by Mehmet Özkan on 8.10.2023.
//

struct CategoryModel: Codable {
    let idCategory: String?
    let strCategory: String?
    let strCategoryThumb: String?
    let strCategoryDescription: String?
}


struct CategoryResponse: Codable {
    let categories: [CategoryModel]?
    
}



