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
}

// MARK: - NetworkLoginFake
final class NetworkHomeFake: NetworkHomeProtocol {
    

    func getAllServices() async throws -> [Service] {

        return [
            Service(id: UUID(), category: Category.hairSalon, name: "La puri", punctuation: 4.5, distance: 1.2, info: "Each haircut begins with a complete consultation and hair analysis, followed by a magnificent shampoo and relaxing scalp massage. After your cut, we finish with a technical blow dry style and our recommendations for at home hair care. ", favourite: false, localization: CLLocationCoordinate2D()),
            Service(id: UUID(), category: Category.lawyers, name: "Phoenix Wright", punctuation: 5, distance: 0.5, info: "Our people are pioneering, incisive, accountable andfearless in our commitment to create success for our clients. We provide a new level of legal service that bridges the gap between the law and modern business reality.", favourite: true, localization: CLLocationCoordinate2D()),
            Service(id: UUID(), category: Category.restaurants, name: "ModernUrban", punctuation: 4.9, distance: 2.5, info: "ModernUrban bridges the traditional with the contemporary, bringing live-fire cooking, housemade pasta, and a robust Italian wine list to the heart of Manhattan West.", favourite: false, localization: CLLocationCoordinate2D())
        ]
    }
}

