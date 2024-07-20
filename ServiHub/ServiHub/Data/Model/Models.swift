//
//  Models.swift
//  ServiHub
//
//  Created by Alejandro Alberto Gavira García on 17/7/24.
//

import Foundation

struct Category: Codable {
    let id: UUID?
    let name: String
}

struct Service: Codable {
    let id: UUID
    let category: Category
    let name: String
    let note: Float?
    let distance: Float?
}

struct ServiceCategory {
    let category: Category
    var services: [Service]
}
