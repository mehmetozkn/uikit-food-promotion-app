//
//  HomeService.swift
//  FoodPromotionApp
//
//  Created by Mehmet Özkan on 8.10.2023.
//

import Alamofire

protocol IHomeService {
    func fetchAllCategories(onSuccess:@escaping ([CategoryModel]?)-> Void, onFail: @escaping (String?) -> Void)
}

enum HomePath: String {
    case CATEGORIES = "/categories.php"
}

extension HomePath {

    func withBaseUrl() -> String {
        return "https://www.themealdb.com/api/json/v1/1\(self.rawValue)"
    }
}


struct HomeService : IHomeService {
    func fetchAllCategories(onSuccess: @escaping ([CategoryModel]?) -> Void, onFail: @escaping (String?) -> Void) {
        AF.request(HomePath.CATEGORIES.withBaseUrl(), method: .get).validate().responseDecodable(of: CategoryResponse.self) { (response) in
            guard let categoryResponse = response.value else {
                onFail(response.debugDescription)
                return
            }
            let categories = categoryResponse.categories
            onSuccess(categories)
        }
    }
    
}
