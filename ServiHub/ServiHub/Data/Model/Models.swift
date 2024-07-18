//
//  Models.swift
//  ServiHub
//
//  Created by Alejandro Alberto Gavira García on 17/7/24.
//

import Foundation
import CoreLocation

extension CLLocationCoordinate2D: Codable {
    public enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(latitude, forKey: .latitude)
        try container.encode(longitude, forKey: .longitude)
        }

    public init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: CodingKeys.self)
        latitude = try values.decode(Double.self, forKey: .latitude)
        longitude = try values.decode(Double.self, forKey: .longitude)
    }
}

enum Category: Codable {
    case barberShop
    case hairSalon
    case restaurants
    case lawyers
    case dentist
    case gym
    case spa
    case tutor
    case plumber
    case electrician
    case mechanic
    case cleaner
    case babysitter
    case dogWalker
    case photographer
    case caterer
    case tailor
    case therapist
    case accountant
}

struct Service: Codable {
    let id: UUID
    let category: Category
    let name: String
    let punctuation: Float?
    let distance: Float?
    let info: String?
    let favourite: Bool?
    //let localization: CLLocationCoordinate2D?
}

struct ServiceCategory {
    let category: Category
    var services: [Service]
}
