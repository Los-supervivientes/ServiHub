//
//  HomeFilterBar.swift
//  ServiHub
//
//  Created by Alejandro Alberto Gavira García on 17/7/24.
//

import SwiftUI

struct FilterBar: View {
    @Binding var selectCategory: String?
    var categories: [Category]
    var categorySelected: (String) -> Void
    var clearSelection: () -> Void
    

    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack() {
                if selectCategory != nil, let selectCategory = selectCategory {
                    Button(action: {
                        clearSelection()
                    }) {
                        Text("Remove filter")
                            .padding()
                            .background(CustomColor.thirdColor)
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    }
                } else {
                    ForEach(categories, id: \.self) { category in
                        Button(action: {
                            categorySelected(category.name)
                        }) {
                            Text(category.name)
                                .padding()
                                .background(CustomColor.secundaryColor)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                        }
                    }
                }
            }
            .padding()
        }
    }
}
