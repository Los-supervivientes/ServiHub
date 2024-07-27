//
//  HomeViewModel.swift
//  ServiHub
//
//  Created by Diego Andrades on 4/7/24.
//

import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    
    @Published var typeUser: Bool
    @Published var categories: [Category] = []
    @Published var services: [Service] = []
    @Published var filterServiceByCategory: [ServiceCategory] = []
    @Published var selectedCategory: String? = nil
    @Published var ownServices : [Service] = []
    
    var repo: HomeRepositoryProtocol
    
    //MARK: - FIX AFTER REPOSITORY WORKS
    init(repo: HomeRepositoryProtocol = HomeRepository(network: NetworkHomeFake()), typeUser: Bool = true) {
        self.repo = repo
        self.typeUser = typeUser
        
        Task {
            self.categories = try await repo.getAllCategories()
            self.services = try await repo.getAllServices()
            
            if typeUser == false {
//                categories.insert(Category(id: UUID(), name: "Custom"), at: 0)
                ownServices = try await repo.getCustomServices()
            }
            
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
    
    func newCustomSerrvice(){
        ownServices.append(Service(id: UUID(), category: Category(id: UUID(), name: "Custom"), name: "Keepcoding", info: "dasdasda", imageURL: "keepcoding"))
    }
    
}
