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

        let categories = [
            Category(id: UUID(), name: "Electricista"),
            Category(id: UUID(), name: "Peluquería"),
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
            Category(id: UUID(), name: "Abogado")
        ]
        
        return [
            Service(id: UUID(), category: categories[0], name: "Antonio's Electrical Services", info: "Reliable and efficient electrical repairs and installations.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[0], name: "Bright Sparks", info: "Professional electrical services for homes and businesses.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[0], name: "Power House Electricians", info: "Expert electricians for all your power needs.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[0], name: "Electric Solutions", info: "Innovative electrical solutions for modern living.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[0], name: "Voltage Pros", info: "Top-notch electrical services with a focus on safety.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[0], name: "Current Masters", info: "Experienced electricians for residential and commercial projects.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[1], name: "La puri", info: "Each haircut begins with a complete consultation and hair analysis.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[1], name: "ModernUrban", info: "Bringing live-fire cooking, housemade pasta, and a robust wine list.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[1], name: "Hair Harmony", info: "Perfect harmony of traditional and contemporary hair styling.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[1], name: "Salon Elegance", info: "Elegant haircuts and styles for all occasions.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[1], name: "Chic Cuts", info: "Stylish and chic haircuts by professional stylists.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[1], name: "Urban Trends", info: "Trendy and modern hairstyles to match your lifestyle.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[2], name: "Smart Tutors", info: "Personalized tutoring services for all subjects and levels.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[2], name: "EduCare", info: "Caring and professional educators for your child's success.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[2], name: "Bright Minds", info: "Enhancing learning experiences with expert educators.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[2], name: "Knowledge Hub", info: "Your hub for quality education and learning.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[2], name: "EduPro", info: "Professional education services for all age groups.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[2], name: "LearnEase", info: "Making learning easy and enjoyable.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[3], name: "QuickFix Plumbing", info: "Fast and reliable plumbing services.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[3], name: "PlumbPro", info: "Professional plumbing solutions for your home and office.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[3], name: "WaterWorks", info: "Expert plumbers for all your water needs.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[3], name: "FlowMasters", info: "Ensuring smooth water flow with expert plumbing.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[3], name: "PipeDreams", info: "Your dream plumbing service provider.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[3], name: "PlumbEase", info: "Easy and efficient plumbing solutions.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[4], name: "Crafted Carpentry", info: "Expert carpentry services for all your needs.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[4], name: "WoodWorks", info: "Quality woodworking and carpentry services.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[4], name: "TimberArt", info: "Artistic and functional carpentry.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[4], name: "Fine Finish", info: "Fine finishing carpentry for your home.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[4], name: "WoodCraft", info: "Crafting wood into beautiful furniture.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[4], name: "Timber Masters", info: "Master carpenters at your service.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[5], name: "Green Thumb", info: "Expert gardening services to beautify your garden.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[5], name: "Garden Pros", info: "Professional gardeners for all your gardening needs.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[5], name: "Bloom Gardens", info: "Making your garden bloom beautifully.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[5], name: "Nature's Touch", info: "Touch of nature in every garden.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[5], name: "Green Gardens", info: "Creating lush green gardens.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[5], name: "Garden Experts", info: "Expert advice and services for your garden.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[6], name: "Sparkle Clean", info: "Professional cleaning services for homes and offices.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[6], name: "Clean Sweep", info: "Efficient and thorough cleaning services.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[6], name: "Shiny Home", info: "Making your home shine with our cleaning services.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[6], name: "Fresh Start", info: "Fresh and clean homes with our services.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[6], name: "Clean House", info: "Expert cleaning services for a spotless home.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[6], name: "Bright Clean", info: "Bright and clean homes and offices.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[7], name: "Perfect Paint", info: "Professional painting services for homes and offices.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[7], name: "Color Pros", info: "Expert painters for all your painting needs.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[7], name: "Hue Masters", info: "Masters of color and painting.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[7], name: "Paint Perfection", info: "Perfect paint jobs every time.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[7], name: "Color Craft", info: "Crafting beautiful spaces with paint.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[7], name: "Paint Pro", info: "Professional painting services for a fresh look.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[8], name: "Repair Masters", info: "Expert repair services for all needs.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[8], name: "FixIt Pros", info: "Professional repair services for homes and businesses.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[8], name: "QuickFix", info: "Quick and reliable repair services.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[8], name: "RepairEase", info: "Making repairs easy and hassle-free.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[8], name: "Handy Helpers", info: "Your handy helpers for all repairs.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[8], name: "Repair Experts", info: "Expert repairs for all types of issues.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[9], name: "LockSmith Pros", info: "Professional locksmith services.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[9], name: "Key Masters", info: "Master locksmith services for all needs.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[9], name: "Secure Locks", info: "Ensuring your security with expert locksmith services.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[9], name: "LockEase", info: "Easy and efficient locksmith services.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[9], name: "Key Experts", info: "Experts in all types of locks and keys.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[9], name: "SafeLocks", info: "Safe and secure locksmith services.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[10], name: "Nutrition Pros", info: "Professional nutrition advice and services.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[10], name: "Healthy Living", info: "Helping you live a healthy and balanced life.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[10], name: "NutriCare", info: "Caring for your nutritional needs.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[10], name: "Fit and Healthy", info: "Your guide to a fit and healthy lifestyle.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[10], name: "Nutrition Experts", info: "Expert advice for a balanced diet.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[10], name: "NutriGuide", info: "Guiding you to better nutrition.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[11], name: "Physio Pros", info: "Professional physiotherapy services.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[11], name: "PhysioCare", info: "Caring for your physical health.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[11], name: "FitPhysio", info: "Helping you stay fit and healthy.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[11], name: "Physio Experts", info: "Expert physiotherapy for all needs.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[11], name: "PhysioEase", info: "Easy and effective physiotherapy.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[11], name: "Physio Solutions", info: "Solutions for all your physiotherapy needs.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[12], name: "MindCare", info: "Professional psychological services.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[12], name: "Psyche Help", info: "Helping you maintain a healthy mind.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[12], name: "MindMasters", info: "Masters in psychological care.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[12], name: "Psych Experts", info: "Expert psychological services.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[12], name: "MindEase", info: "Easy and effective psychological help.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[12], name: "Psyche Solutions", info: "Solutions for all your psychological needs.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[13], name: "Gourmet Dine", info: "Fine dining experiences.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[13], name: "Food Heaven", info: "Heavenly food and dining services.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[13], name: "Taste Buds", info: "Exciting flavors for your taste buds.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[13], name: "DineWell", info: "Dine well with our exquisite services.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[13], name: "Epicurean Delights", info: "Delightful dining experiences.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[13], name: "Savory Bites", info: "Savory and delicious dining.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[14], name: "Phoenix Wright", info: "Pioneering legal services bridging the gap between law and business.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[14], name: "Legal Masters", info: "Masters in providing legal solutions.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[14], name: "Law Pros", info: "Professional legal services for all your needs.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[14], name: "LawEase", info: "Making legal processes easy and efficient.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[14], name: "Legal Experts", info: "Experts in all areas of law.", imageURL: "https://via.placeholder.com/150"),
                Service(id: UUID(), category: categories[14], name: "Justice League", info: "Ensuring justice with professional legal services.", imageURL: "https://via.placeholder.com/150")
        ]
    }
    
    func getAllCategories() async throws -> [Category] {

        return [
                Category(id: UUID(), name: "Electricista"),
                Category(id: UUID(), name: "Peluquería"),
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
                Category(id: UUID(), name: "Abogado")
        ]
    }
}

