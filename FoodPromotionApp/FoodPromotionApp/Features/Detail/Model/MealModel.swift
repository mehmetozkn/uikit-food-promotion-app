//
//  MealModel.swift
//  FoodPromotionApp
//
//  Created by Mehmet Özkan on 8.10.2023.
//

struct MealModel : Codable {
    let idMeal: String?
    let strMeal: String?
    let strMealThumb: String?
}


struct MealResponse: Codable {
    let meals: [MealModel]?
    

}
