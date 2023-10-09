//
//  HomeViewModel.swift
//  FoodPromotionApp
//
//  Created by Mehmet Özkan on 8.10.2023.
//
 /*
protocol IHomeViewModel {
    func fetchItems()
    func changeLoading()
    
    var categories: [CategoryModel] {get set}
    var homeService: IHomeService {get}
    
    

}


class HomeViewModel : IHomeViewModel {
    
    var categories: [CategoryModel] = []
    var homeService: IHomeService
    private var isLoading = false
    
    init() {
        homeService = HomeService()
    }
    
    
    func fetchItems() {
        homeService.fetchAllCategories { [weak self] (result) in
            self?.changeLoading()
            self?.categories = result ?? []
            
        } onFail: { <#String?#> in
            <#code#>
        }

    }
    
    func changeLoading() {
        <#code#>
    }
 
    
}

*/
