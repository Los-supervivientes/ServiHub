//
//  Models.swift
//  ServiHub
//
//  Created by Alejandro Alberto Gavira García on 17/7/24.
//

import Foundation

struct Category: Codable, Hashable {
    let id: UUID?
    let name: String
}

struct Service: Codable, Identifiable {
    let id: UUID
    let category: Category
    let name: String
    let info: String
    let imageURL: String
}

struct ServiceCategory {
    let category: Category
    var services: [Service]
}
