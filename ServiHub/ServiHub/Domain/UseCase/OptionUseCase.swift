//
//  OptionUseCase.swift
//  ServiHub
//
//  Created by Rocio Martos on 22/7/24.
//

import Foundation
import Combine

// MARK: - Protocol
protocol OptionsUseCaseProtocol {
    func saveChanges(notificationsEnabled: Bool, faceIDEnabled: Bool) async throws
    func logout() async
    func unsubscribeAsProfessional() async throws
}

// MARK: - OptionsUseCase
final class OptionsUseCase: OptionsUseCaseProtocol {
    // MARK: Save Changes
    func saveChanges(notificationsEnabled: Bool, faceIDEnabled: Bool) async throws {
        // Guarda las configuraciones en UserDefaults
        UserDefaults.standard.set(notificationsEnabled, forKey: "notificationsEnabled")
        UserDefaults.standard.set(faceIDEnabled, forKey: "faceIDEnabled")
        print("Changes saved")
    }
    
    // MARK: Logout
    func logout() async {
        // Limpia el estado de la sesión y cualquier otro dato necesario
        UserDefaults.standard.removeObject(forKey: "userToken") // Por ejemplo, elimina el token de usuario
        print("Logged out")
    }
    func unsubscribeAsProfessional() async throws {
        // Ejemplo de llamada a una API simulada
        let url = URL(string: "https://example.com/api/unsubscribe")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
    }
    
}
// MARK: - OptionsUseCaseFake
final class OptionsUseCaseFake: OptionsUseCaseProtocol {
    func unsubscribeAsProfessional() async throws {
        // Ejemplo de llamada a una API simulada
        let url = URL(string: "https://example.com/api/unsubscribe")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
    }
    
    
    // MARK: Properties
    private var mockSettings: (notificationsEnabled: Bool, faceIDEnabled: Bool) = (true, false)
    
    // MARK: Save Changes
    func saveChanges(notificationsEnabled: Bool, faceIDEnabled: Bool) async throws {
        // Simulación de la acción para guardar cambios
        print("Fake changes saved")
    }
    
    // MARK: Logout
    func logout() async {
        // Simulación del proceso de logout
        print("Fake logged out")
        
    }
    
    // MARK: Update Settings
    func updateSettings(notificationsEnabled: Bool, faceIDEnabled: Bool) async throws {
        // Actualiza los valores de configuración en la implementación fake
        mockSettings.notificationsEnabled = notificationsEnabled
        mockSettings.faceIDEnabled = faceIDEnabled
    }
    
    // MARK: Get Settings
    func getSettings() async -> (notificationsEnabled: Bool, faceIDEnabled: Bool) {
        // Devuelve los valores de configuración en la implementación fake
        return mockSettings
    }
}