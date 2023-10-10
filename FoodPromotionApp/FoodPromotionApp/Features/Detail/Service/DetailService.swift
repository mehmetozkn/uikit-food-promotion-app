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

enum DetailServiceEndPoint: String {
    case BASE_URL = "https://www.themealdb.com/api/json/v1/1"
    case PATH = "/filter.php?c="

    static func characterPath() -> String {
        return "\(BASE_URL.rawValue)\(PATH.rawValue)"
    }
}


struct DetailService : IDetailService {
    func fetchMealsByCategory(value: String, onSuccess: @escaping ([MealModel]?) -> Void, onFail: @escaping (String?) -> Void) {
        AF.request(DetailServiceEndPoint.characterPath() + value, method: .get).validate().responseDecodable(of: MealResponse.self) { (response) in
            guard let mealResponse = response.value else {
                onFail(response.debugDescription)
                return
            }
            let meals = mealResponse.meals
            onSuccess(meals)
        }
    }
}
