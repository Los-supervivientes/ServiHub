//
//  RegisterUseCase.swift
//  ServiHub
//
//  Created by Diego Andrades on 18/7/24.
//

import Foundation


protocol CategoriesUseCaseProtocol {
    var repo: CategoriesRepositoryProtocol {get set}
    func getCategories() async -> [CategoriesModel]
}


//Real
final class CategoriesUseCase: CategoriesUseCaseProtocol{
    var repo: CategoriesRepositoryProtocol
    init(repo: CategoriesRepositoryProtocol = CategoriesRepository(network: NetworkCategories())){
        self.repo = repo
    }
    
    func getCategories() async -> [CategoriesModel] {
        await repo.getCategories()
    }
}

//Fake
final class CategoriesUseCaseFake: CategoriesUseCaseProtocol {
    var repo: CategoriesRepositoryProtocol
    init(repo: CategoriesRepositoryProtocol = CategoriesRepository(network: NetworkCategories())){
        self.repo = repo
    }
    
    func getCategories() async -> [CategoriesModel] {
        await repo.getCategories()
    }
}
