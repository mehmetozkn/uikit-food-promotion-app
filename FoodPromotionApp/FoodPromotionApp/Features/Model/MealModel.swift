//
//  MealModel.swift
//  FoodPromotionApp
//
//  Created by Mehmet Özkan on 8.10.2023.
//

struct MealModel : Codable {
    let id: String?
    let name: String?
    let imageUrl: String?
}

private enum CodingKeys: String, CodingKey {
    case id = "idMeal"
    case name = "strMeal"
    case imageUrl = "strMealThumb"
}


struct MealList: Codable {
    let meals: [MealModel?]?
    
    private enum CodingKeys: String, CodingKey {
        case meals = "meals"

    }

}
