//
//  DetailViewModel.swift
//  FoodPromotionApp
//
//  Created by Mehmet Özkan on 10.10.2023.
//

import Foundation



final class DetailViewModel {

    var detailOutput: DetailOutput?

    func setDelegate(output: DetailOutput) {
        detailOutput = output
    }

    var meals: [MealModel] = []
    let detailService: DetailService = DetailService()

    func fetchItems(category: String) {
        detailService.fetchMealsByCategory(value: category, onSuccess: { [weak self] (meals) in

            if let meals = meals {
                self?.meals = meals
                self?.detailOutput?.saveDatas(values: self?.meals ?? [])


            } else {
                print("No Data")
            }
            
        }) { (error) in
            if let error = error {
                print(error)
            }
        }
    }

}
