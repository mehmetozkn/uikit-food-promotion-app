//
//  DetailService.swift
//  FoodPromotionApp
//
//  Created by Mehmet Özkan on 10.10.2023.
//

import Foundation
import Alamofire


protocol IDetailService {
    func fetchMealsByCategory(value: String, onSuccess: @escaping ([MealModel]?) -> Void, onFail: @escaping (String?) -> Void)
}

enum DetailPath: String {
    case MEALS = "/filter.php?c="
}

extension DetailPath {

    func withBaseUrl() -> String {
        return "https://www.themealdb.com/api/json/v1/1\(self.rawValue)"
    }
}


struct DetailService : IDetailService {
    func fetchMealsByCategory(value: String, onSuccess: @escaping ([MealModel]?) -> Void, onFail: @escaping (String?) -> Void) {
        AF.request(DetailPath.MEALS.withBaseUrl(), method: .get).validate().responseDecodable(of: MealResponse.self) { (response) in
            guard let mealResponse = response.value else {
                onFail(response.debugDescription)
                return
            }
            let meals = mealResponse.meals
            onSuccess(meals)
        }
    }
    
}
