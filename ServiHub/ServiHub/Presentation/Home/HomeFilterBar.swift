//
//  HomeFilterBar.swift
//  ServiHub
//
//  Created by Alejandro Alberto Gavira García on 17/7/24.
//

import SwiftUI

struct FilterBar: View {
    @Binding var selectedCategories: Set<Category>
    var categories: [Category]
    var categorySelected: (Category) -> Void
    
    private let secundaryColor = Color(red: 179/255, green: 176/255, blue: 217/255)
    private let thirdColor = Color(red: 179/255, green: 220/255, blue: 217/255)

    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack() {
                Button(action: {
                    selectedCategories.removeAll()
                }) {
                    Text("All")
                        .padding()
                        .background(selectedCategories.isEmpty ? thirdColor : secundaryColor)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                }
                
                ForEach(categories, id: \.self) { category in
                    Button(action: {
                        categorySelected(category)
                    }) {
                        Text(category.name)
                            .padding()
                            .background(selectedCategories.contains(category) ? thirdColor : secundaryColor)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    }
                }
            }
            .padding()
        }
    }
}
