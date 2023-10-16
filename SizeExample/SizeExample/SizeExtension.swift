//
//  SizeExtension.swift
//  SizeExample
//
//  Created by Mehmet Özkan on 15.10.2023.
//

import Foundation
import SwiftUI

extension View {
    func frameWithGeometryReader(width: CGFloat? = nil, height: CGFloat? = nil) -> some View {
        GeometryReader { geometry in
            self.frame(
                width: width ?? geometry.size.width,
                height: height ?? geometry.size.height
            )
        }
    }
}
