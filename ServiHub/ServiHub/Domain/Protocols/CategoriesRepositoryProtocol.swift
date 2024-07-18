//
//  RegisterRepositoryProtocol.swift
//  ServiHub
//
//  Created by Diego Andrades on 18/7/24.
//

import Foundation


protocol CategoriesRepositoryProtocol {
    
    func getCategories() async -> [CategoriesModel]
}
