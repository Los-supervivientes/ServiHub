//
//  HomeViewModel.swift
//  ServiHub
//
//  Created by EquipoSupervivientes!! on 4/7/24.
//

import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    
    @Published var typeUser: Bool = false
    @Published var categories: [Category] = []
    @Published var services: [Service] = []
    @Published var filterServiceByCategory: [ServiceCategory] = []
    @Published var selectedCategory: String? = nil
    
    var repo: HomeRepositoryProtocol
    
    //MARK: - FIX AFTER REPOSITORY WORKS
    init(repo: HomeRepositoryProtocol = HomeRepository(network: NetworkHome())) {
        self.repo = repo
        
        Task {
            self.categories = try await repo.getAllCategories()
            self.services = try await repo.getAllServices()
            
            self.filterServiceByCategory = servicesIntoCategories(services: self.services)
        }
    }
    
    private func servicesIntoCategories(services: [Service]) -> [ServiceCategory] {
        let groupedServices = Dictionary(grouping: services) { $0.category }
        return groupedServices.map { ServiceCategory(category: $0.key, services: $0.value) }
    }
    
    func toggleCategoryFilter(_ category: Category) {
        if selectedCategory == category.name {
            selectedCategory = nil
        } else {
            selectedCategory = category.name
        }
        applyFilter()
    }
    
    func applyFilter() {
        if let category = selectedCategory {
            let filteredServices = services.filter { $0.category.name == category }
            self.filterServiceByCategory = servicesIntoCategories(services: filteredServices)
        } else {
            self.filterServiceByCategory = servicesIntoCategories(services: services)
        }
    }
    
    func allCategories() -> [Category] {
        return self.categories
        }
    
}
