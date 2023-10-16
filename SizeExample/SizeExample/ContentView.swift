//
//  ContentView.swift
//  SizeExample
//
//  Created by Mehmet Özkan on 15.10.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            VStack {
                Text("Orta Panel")
                    .frameWithGeometryReader(width: 0.3, height: 0.4)
                    .background(Color.blue)
                
                
            }
                    
                    VStack {
                        Text("Orta Pel")
                            .frameWithGeometryReader(width: 0.3, height: 0.4)
                            .background(Color.green)
                        
                        
                    }
                    
            VStack {
                Text("Orta Panel")
                    .frameWithGeometryReader(width: 0.1, height: 0.2)
                    .background(Color.gray)
                
                
            }
                }
                .frameWithGeometryReader()
    }
}

#Preview {
    ContentView()
}
