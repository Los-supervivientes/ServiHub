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
            throw NetworkError.tokenFormatError // errorew de data
        }
        return servicesResponse
    }
    
    func getAllCategories() async throws -> [Category] {
        let request = try await NetworkRequestHome().requestForGetAllCategories()
        let (data, response) = try await URLSession.shared.data(for: request)
            
        guard let httpResponse = (response as? HTTPURLResponse),
              httpResponse.getStatusCode() == HTTPResponseCodes.SUCESS else {
            throw NetworkError.statusCodeError(response.getStatusCode())
        }
        guard let categoryResponse = try? JSONDecoder().decode([Category].self, from: data) else {
            throw NetworkError.tokenFormatError // errorew de data
        }
        return categoryResponse
    }
    
}

// MARK: - NetworkLoginFake
final class NetworkHomeFake: NetworkHomeProtocol {
    
    func getAllServices() async throws -> [Service] {

        return [
            Service(id: UUID(), category: Category.init(id: UUID(), name: "Peluquería"), name: "La puri", info: "Each haircut begins with a complete consultation and hair analysis, followed by a magnificent shampoo and relaxing scalp massage. After your cut, we finish with a technical blow dry style and our recommendations for at home hair care. ", imageURL: "url"),
            Service(id: UUID(), category: Category.init(id: UUID(), name: "Abogado"), name: "Phoenix Wright", info: "Our people are pioneering, incisive, accountable andfearless in our commitment to create success for our clients. We provide a new level of legal service that bridges the gap between the law and modern business reality.", imageURL: "url"),
            Service(id: UUID(), category: Category.init(id: UUID(), name: "Peluquería"), name: "ModernUrban", info: "ModernUrban bridges the traditional with the contemporary, bringing live-fire cooking, housemade pasta, and a robust Italian wine list to the heart of Manhattan West.", imageURL: "url")
        ]
    }
    
    func getAllCategories() async throws -> [Category] {

        return [
            Category(id: UUID(), name: "Electricista"),
            Category(id: UUID(), name: "Educador"),
            Category(id: UUID(), name: "Fontanero"),
            Category(id: UUID(), name: "Carpintero"),
            Category(id: UUID(), name: "Jardinero"),
            Category(id: UUID(), name: "Limpieza"),
            Category(id: UUID(), name: "Pintor"),
            Category(id: UUID(), name: "Reparación"),
            Category(id: UUID(), name: "Cerrajero"),
            Category(id: UUID(), name: "Nutricionista"),
            Category(id: UUID(), name: "Fisio"),
            Category(id: UUID(), name: "Psicologo"),
            Category(id: UUID(), name: "Restaurante"),
            Category(id: UUID(), name: "Abogados")
        ]
    }
}

