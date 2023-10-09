//
//  CustomImageView.swift
//  FoodPromotionApp
//
//  Created by Mehmet Özkan on 9.10.2023.
//

import SwiftUI
import Kingfisher

struct CustomImageView: View {
     let imageUrl: String
  
    var body: some View {
        VStack {
            KFImage(URL(string: imageUrl))
                .resizable()

        }
    }
}
