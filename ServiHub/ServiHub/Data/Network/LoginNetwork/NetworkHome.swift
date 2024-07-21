//
//  NetworkHome.swift
//  ServiHub
//
//  Created by Cristian Contreras Velásquez on 17-07-24.
//

import Foundation
import CoreLocation

// MARK: - Protocol
protocol NetworkHomeProtocol {
    func getAllServices() async throws -> [Service]
    func getAllCategories() async throws -> [Category]
}

// MARK: - NetworkHome
final class NetworkHome: NetworkHomeProtocol {
    
    // MARK: getAllServices
    func getAllServices() async throws -> [Service] {
        let request = try await NetworkRequestHome().requestForGetAllServices()
        let (data, response) = try await URLSession.shared.data(for: request)
            
        guard let httpResponse = (response as? HTTPURLResponse),
              httpResponse.getStatusCode() == HTTPResponseCodes.SUCESS else {
            throw NetworkError.statusCodeError(response.getStatusCode())
        }
        guard let servicesResponse = try? JSONDecoder().decode([Service].self, from: data) else {
            throw NetworkError.dataDecodingFailed
        }
        return servicesResponse
    }
    
    // MARK: getAllCategories
    func getAllCategories() async throws -> [Category] {
        let request = try await NetworkRequestHome().requestForGetAllCategories()
        let (data, response) = try await URLSession.shared.data(for: request)
            
        guard let httpResponse = (response as? HTTPURLResponse),
              httpResponse.getStatusCode() == HTTPResponseCodes.SUCESS else {
            throw NetworkError.statusCodeError(response.getStatusCode())
        }
        guard let categoriesResponse = try? JSONDecoder().decode([Category].self, from: data) else {
            throw NetworkError.dataDecodingFailed
        }
        print(categoriesResponse)
        return categoriesResponse
    }
}

// MARK: - NetworkLoginFake
final class NetworkHomeFake: NetworkHomeProtocol {
    func getAllCategories() async throws -> [Category] {
        [Category(id: UUID(), name: "")]
    }
    
    

    func getAllServices() async throws -> [Service] {

        return [
            
            Service(id: UUID(), category: Category(id: UUID(uuidString: "d4788e0c-8f3f-493a-8f8f-4c3d6c38e1b1"), name: "Peluquería"), name: "La puri", note: 4.5, distance: 1.5),
            Service(id: UUID(), category: Category(id: UUID(uuidString: "7eb8111a-9fe5-4cf0-a532-f49454baf38a"), name: "Abogado"), name: "P. Wright", note: 4.9, distance: 2.5),
            Service(id: UUID(), category: Category(id: UUID(uuidString: "fbf33896-c766-413c-a295-289f7898d6ad"), name: "Catering"), name: "ModernUrban", note: 5.0, distance: 0.5),
            Service(id: UUID(), category: Category(id: UUID(uuidString: "ce5ac673-1ae6-4ebe-a6de-6d07610fd5a3"), name: "Guardería de mascotas"), name: "Perritos", note: 4.4, distance: 0.5),
            Service(id: UUID(), category: Category(id: UUID(uuidString: "f6317e56-9273-45ed-b952-16fd21977a08"), name: "Psicólogo"), name: "Dr. Peter", note: 3.9, distance: 2.5),
            Service(id: UUID(), category: Category(id: UUID(uuidString: "c3c2c879-c3a4-4288-a3e2-c77f9e2c03c1"), name: "Fontanero"), name: "El mejor", note: 5.0, distance: 0.5),
            Service(id: UUID(), category: Category(id: UUID(uuidString: "ad1cc5ee-2867-4477-bee7-c9afc05c64a3"), name: "Carpintero"), name: "Carpintería John", note: 4.5, distance: 1.5),
            Service(id: UUID(), category: Category(id: UUID(uuidString: "77af9ade-e08f-4636-87af-6043864b30a6"), name: "Automóviles y Vehículos"), name: "ServiAuto", note: 4.9, distance: 2.5),
            Service(id: UUID(), category: Category(id: UUID(uuidString: "638ab73f-d842-44eb-81b3-995162d359dc"), name: "Nutricionista"), name: "Naturdiet", note: 5.0, distance: 0.5),
            Service(id: UUID(), category: Category(id: UUID(uuidString: "254fc6ad-ceb0-46a9-ad36-c5d81e772a94"), name: "Cuidado de ancianos"), name: "Cuidadores", note: 4.4, distance: 0.5),
            Service(id: UUID(), category: Category(id: UUID(uuidString: "05853489-2564-421d-bbe3-4f06f849710b"), name: "Desarrollo de software"), name: "Los super", note: 3.9, distance: 2.5),
            Service(id: UUID(), category: Category(id: UUID(uuidString: "b7251da5-bae5-4eb5-8019-4dbc6a3874b9"), name: "Cuidado de mascotas"), name: "Ace", note: 5.0, distance: 0.5),
        ]
    }
}

