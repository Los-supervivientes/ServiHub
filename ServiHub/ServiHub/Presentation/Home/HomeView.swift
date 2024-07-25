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
    @State private var showingSheet = false
    
    private let secundaryColor = Color(red: 179/255, green: 176/255, blue: 217/255)
    private let colorDarkBG = Color(red: 51/255, green: 75/255, blue: 108/255)
    
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
                        
                        if viewModel.typeUser == false {
                            
                            Text("Own Services")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.leading,-175)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                
                                HStack(spacing: 8) {
                                    ForEach(viewModel.ownServices) { service in
                                        ServiceCardView(service: service)
                                            .frame(width: 250, height: 175)
                                            .padding()
                                        
                                        
                                    }
                                }
                            }
                            .background(.secondary)
                        }
                        
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
            //            .navigationTitle("HOME")
            //            .font(.title)
            .toolbar {
                
                
                ToolbarItem(placement: .navigationBarLeading){
                    Text("HOME")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        print("options")
                        showingSheet.toggle()
                        
                    } label: {
                        
                        
                        Image(systemName: "gear")
                            .resizable()
                            .frame(width: 41, height: 38)
                            .foregroundColor(colorDarkBG)
                            .padding(.trailing, -20.0)
                        
                    }
                    .sheet(isPresented: $showingSheet) {
                        VStack{
                            Capsule()
                                .fill(colorDarkBG)
                                .frame(width: 60, height: 3)
                                .padding(10)
                            
                            
                            OptionsView(viewModel: OptionsViewModel(useCase: OptionsUseCase()))
                        }
                    }
                    .padding(.trailing, 20)
                    .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    
                }
            }
            
        }
    }
}


#Preview {
    HomeView(viewModel: HomeViewModel(typeUser: false))
        .preferredColorScheme(.light)
}
