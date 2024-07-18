//
//  CategoriesModel.swift
//  ServiHub
//
//  Created by Diego Andrades on 18/7/24.
//

import Foundation

// MARK: - CategoriesModelElement
struct CategoriesModel: Codable {
//    let children: [Child]
    let description: String?
    let id: String
    let imageURL: String?
    let name: String
}

//// MARK: - Child
//struct Child: Codable{
//    let id, name: String
//    let description: JSONNull?
//}
//
