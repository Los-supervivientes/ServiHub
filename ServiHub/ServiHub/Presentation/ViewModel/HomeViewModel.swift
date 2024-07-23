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
    @Published var selectedCategories: Set<Category> = []
    
    var repo: HomeRepositoryProtocol
    
    //MARK: - FIX AFTER REPOSITORY WORKS
    init(repo: HomeRepositoryProtocol = HomeRepository(network: NetworkHomeFake())) {
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
        if selectedCategories.contains(category) {
            selectedCategories.remove(category)
        } else {
            selectedCategories.insert(category)
        }
        applyFilter()
    }
    
    func applyFilter() {
        if selectedCategories.isEmpty {
            self.filterServiceByCategory = servicesIntoCategories(services: services)
        } else {
            let filteredServices = services.filter { selectedCategories.contains($0.category) }
            self.filterServiceByCategory = servicesIntoCategories(services: filteredServices)
        }
    }
    
    func allCategories() -> [Category] {
        return self.categories
        }
    
}
