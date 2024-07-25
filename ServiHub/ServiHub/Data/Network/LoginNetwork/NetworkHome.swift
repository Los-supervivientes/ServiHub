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
    func getCustomServices() async throws -> [Service]
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
    
    func getCustomServices() async throws -> [Service] {
        let request = try await NetworkRequestHome().requestForGetAllCategories()
        let (data, response) = try await URLSession.shared.data(for: request)
            
        guard let httpResponse = (response as? HTTPURLResponse),
              httpResponse.getStatusCode() == HTTPResponseCodes.SUCESS else {
            throw NetworkError.statusCodeError(response.getStatusCode())
        }
        guard let customServiceResponse = try? JSONDecoder().decode([Service].self, from: data) else {
            throw NetworkError.tokenFormatError // errorew de data
        }
        return customServiceResponse
    }
    
}

// MARK: - NetworkLoginFake
final class NetworkHomeFake: NetworkHomeProtocol {
    
    func getAllServices() async throws -> [Service] {

        let categories = [
            Category(id: UUID(), name: "Electricista"),
            Category(id: UUID(), name: "Peluquería"),
            Category(id: UUID(), name: "Educador"),
            Category(id: UUID(), name: "Fontanero"),
            Category(id: UUID(), name: "Carpintero"),
            Category(id: UUID(), name: "Jardinero")
        ]
        
        return [
            Service(id: UUID(), category: categories[0], name: "Antonio's Electrical Services", info: "Reliable and efficient electrical repairs and installations.", imageURL: "1"),
                Service(id: UUID(), category: categories[0], name: "Bright Sparks", info: "Professional electrical services for homes and businesses.", imageURL: "2"),
                Service(id: UUID(), category: categories[0], name: "Power House Electricians", info: "Expert electricians for all your power needs.", imageURL: "3"),
                Service(id: UUID(), category: categories[0], name: "Electric Solutions", info: "Innovative electrical solutions for modern living.", imageURL: "4"),
                Service(id: UUID(), category: categories[0], name: "Voltage Pros", info: "Top-notch electrical services with a focus on safety.", imageURL: "5"),
            
            Service(id: UUID(), category: categories[1], name: "La puri", info: "Each haircut begins with a complete consultation and hair analysis.", imageURL: "6"),
                Service(id: UUID(), category: categories[1], name: "ModernUrban", info: "Bringing live-fire cooking, housemade pasta, and a robust wine list.", imageURL: "7"),
                Service(id: UUID(), category: categories[1], name: "Hair Harmony", info: "Perfect harmony of traditional and contemporary hair styling.", imageURL: "8"),
                Service(id: UUID(), category: categories[1], name: "Salon Elegance", info: "Elegant haircuts and styles for all occasions.", imageURL: "9"),
                Service(id: UUID(), category: categories[1], name: "Chic Cuts", info: "Stylish and chic haircuts by professional stylists.", imageURL: "10"),
                
                Service(id: UUID(), category: categories[2], name: "Smart Tutors", info: "Personalized tutoring services for all subjects and levels.", imageURL: "11"),
                Service(id: UUID(), category: categories[2], name: "EduCare", info: "Caring and professional educators for your child's success.", imageURL: "12"),
                Service(id: UUID(), category: categories[2], name: "Bright Minds", info: "Enhancing learning experiences with expert educators.", imageURL: "13"),
                Service(id: UUID(), category: categories[2], name: "Knowledge Hub", info: "Your hub for quality education and learning.", imageURL: "14"),
                Service(id: UUID(), category: categories[2], name: "EduPro", info: "Professional education services for all age groups.", imageURL: "15"),
                
                Service(id: UUID(), category: categories[3], name: "QuickFix Plumbing", info: "Fast and reliable plumbing services.", imageURL: "16"),
                Service(id: UUID(), category: categories[3], name: "PlumbPro", info: "Professional plumbing solutions for your home and office.", imageURL: "17"),
                Service(id: UUID(), category: categories[3], name: "WaterWorks", info: "Expert plumbers for all your water needs.", imageURL: "18"),
                Service(id: UUID(), category: categories[3], name: "FlowMasters", info: "Ensuring smooth water flow with expert plumbing.", imageURL: "19"),
                Service(id: UUID(), category: categories[3], name: "PipeDreams", info: "Your dream plumbing service provider.", imageURL: "20"),
                
                Service(id: UUID(), category: categories[4], name: "Crafted Carpentry", info: "Expert carpentry services for all your needs.", imageURL: "21"),
                Service(id: UUID(), category: categories[4], name: "WoodWorks", info: "Quality woodworking and carpentry services.", imageURL: "22"),
                Service(id: UUID(), category: categories[4], name: "TimberArt", info: "Artistic and functional carpentry.", imageURL: "23"),
                Service(id: UUID(), category: categories[4], name: "Fine Finish", info: "Fine finishing carpentry for your home.", imageURL: "24"),
                Service(id: UUID(), category: categories[4], name: "WoodCraft", info: "Crafting wood into beautiful furniture.", imageURL: "25"),
                
                Service(id: UUID(), category: categories[5], name: "Green Thumb", info: "Expert gardening services to beautify your garden.", imageURL: "26"),
                Service(id: UUID(), category: categories[5], name: "Garden Pros", info: "Professional gardeners for all your gardening needs.", imageURL: "27"),
                Service(id: UUID(), category: categories[5], name: "Bloom Gardens", info: "Making your garden bloom beautifully.", imageURL: "28"),
                Service(id: UUID(), category: categories[5], name: "Nature's Touch", info: "Touch of nature in every garden.", imageURL: "29"),
                Service(id: UUID(), category: categories[5], name: "Green Gardens", info: "Creating lush green gardens.", imageURL: "30")
        ]
    }
    
    func getAllCategories() async throws -> [Category] {

        return [
                Category(id: UUID(), name: "Electricista"),
                Category(id: UUID(), name: "Peluquería"),
                Category(id: UUID(), name: "Educador"),
                Category(id: UUID(), name: "Fontanero"),
                Category(id: UUID(), name: "Carpintero"),
                Category(id: UUID(), name: "Jardinero")
        ]
    }
    
    func getCustomServices() async throws -> [Service] {
        return [
            Service(id: UUID(), category: Category(id: UUID(), name: "Custom"), name: "Keepcoding", info: "dasdasda", imageURL: "keepcoding"),
            Service(id: UUID(), category: Category(id: UUID(), name: "Custom"), name: "VFX", info: "dasdasda", imageURL: "keepcoding"),
            Service(id: UUID(), category: Category(id: UUID(), name: "Custom"), name: "ADD NEW", info: "dasdasda", imageURL: "new")
        ]
    }
}

