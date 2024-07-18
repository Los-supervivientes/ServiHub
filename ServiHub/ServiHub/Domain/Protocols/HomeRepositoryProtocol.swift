//
//  HomeRepositoryProtocol.swift
//  ServiHub
//
//  Created by Cristian Contreras Velásquez on 17-07-24.
//

import Foundation

// MARK: - HomeRepositoryProtocol
protocol HomeRepositoryProtocol {
    func getAllServices() async throws -> [Service]
}
