//
//  HomeRepository.swift
//  ServiHub
//
//  Created by Cristian Contreras Velásquez on 17-07-24.
//

import Foundation

// MARK: - HomeRepository
final class HomeRepository: HomeRepositoryProtocol {
    
    // MARK: Properties
    private var network: NetworkHomeProtocol
    
    // MARK: Inits
    init(network: NetworkHomeProtocol) {
        self.network = network
    }
    
    // MARK: getAllServices
    func getAllServices() async throws -> [Service] {
        return try await network.getAllServices()
    }
    
    func getAllCategories() async throws -> [Category] {
        return try await network.getAllCategories()
    }
}

// MARK: - HomeRepositoryFake
final class HomeRepositoryFake: HomeRepositoryProtocol {
    // MARK: Properties
    private var network: NetworkHomeProtocol
    
    // MARK: Inits
    init(network: NetworkHomeProtocol = NetworkHomeFake()) {
        self.network = network
    }
    
    
    // MARK: getAllServices
    func getAllServices() async throws -> [Service] {
        return try await network.getAllServices()
    }
    
    func getAllCategories() async throws -> [Category] {
        return try await network.getAllCategories()
    }
}

