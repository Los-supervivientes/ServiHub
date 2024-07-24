//
//  HomeView.swift
//  ServiHub
//
//  Created Diego Andrades on 7/7/24.
//

import SwiftUI

//MARK: - Pantalla de Home

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    
    private let secundaryColor = Color(red: 179/255, green: 176/255, blue: 217/255)
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                Image(.fondoLoading)
                    .resizable()
                    .ignoresSafeArea()
                    .id(1)
                
                VStack(spacing: 16) {
                    FilterBar(selectCategory: $viewModel.selectedCategory, categories: viewModel.allCategories(), categorySelected: { categoryName in
                        viewModel.selectedCategory = categoryName
                        viewModel.applyFilter()
                    }, clearSelection: {
                        viewModel.selectedCategory = nil
                        viewModel.applyFilter()
                    })
                    .padding(.horizontal, 8)
                    
                    ScrollView(.vertical) {
                        ForEach(viewModel.filterServiceByCategory, id: \.category) { serviceCategory in
                            VStack(alignment: .leading) {
                                Text(serviceCategory.category.name)
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .padding([.leading, .top])
                                
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 8) {
                                        ForEach(serviceCategory.services, id: \.id) { service in
                                            ServiceCardView(service: service)
                                                .frame(width: 250, height: 175)
                                                .padding()
                                                
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("HOME")
            .font(.title)
        }
    }
}


#Preview {
    HomeView(viewModel: HomeViewModel())
        .preferredColorScheme(.light)
}
