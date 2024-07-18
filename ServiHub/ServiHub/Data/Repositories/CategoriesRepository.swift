//
//  RegisterRepository.swift
//  ServiHub
//
//  Created by Diego Andrades on 18/7/24.
//

import Foundation

// Caso Real
final class CategoriesRepository: CategoriesRepositoryProtocol {
    private var Network: NetworkCategoriesProtocol
    
    init(network: NetworkCategoriesProtocol = NetworkCategories()){
        Network = network
    }
    
    func getCategories() async -> [CategoriesModel] {
        return await Network.getCategories()
    }
}


 // Caso Fake
final class RegisterRepositoryFake: CategoriesRepositoryProtocol {
    private var Network: NetworkCategoriesProtocol
    
    init(network: NetworkCategoriesProtocol = NetworkCategoriesFake()){
        Network = network
    }
    
    func getCategories() async -> [CategoriesModel] {
        return await Network.getCategories()
    }
}
