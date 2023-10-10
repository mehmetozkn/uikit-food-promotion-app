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

enum HomeServiceEndPoint: String {
    case BASE_URL = "https://www.themealdb.com/api/json/v1/1"
    case PATH = "/categories.php"

    static func characterPath() -> String {
        return "\(BASE_URL.rawValue)\(PATH.rawValue)"
    }
}


struct HomeService : IHomeService {
    func fetchAllCategories(onSuccess: @escaping ([CategoryModel]?) -> Void, onFail: @escaping (String?) -> Void) {
        AF.request(HomeServiceEndPoint.characterPath(), method: .get).validate().responseDecodable(of: CategoryResponse.self) { (response) in
            guard let categoryResponse = response.value else {
                onFail(response.debugDescription)
                return
            }
            let categories = categoryResponse.categories
            onSuccess(categories)
        }
    }
    
}
