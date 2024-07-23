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
    func saveChanges() async throws
    func logout() async
}
// MARK: - OptionsUseCase
final class OptionsUseCase: OptionsUseCaseProtocol {
    // MARK: Save Changes
    func saveChanges() async throws {
        // Simulación de la acción para guardar cambios
        // Implementa la lógica real aquí
        print("Changes saved")
    }
    
    // MARK: Logout
    func logout() async {
        // Simulación del proceso de logout
        print("Logged out")
        // Implementa la lógica para limpiar el estado de sesión aquí
    }
    
}

// MARK: - OptionsUseCaseFake
final class OptionsUseCaseFake: OptionsUseCaseProtocol {
    
    // MARK: Properties
    private var mockSettings: (notificationsEnabled: Bool, faceIDEnabled: Bool) = (true, false)
    
    // MARK: Save Changes
    func saveChanges() async throws {
        // Simulación de la acción para guardar cambios
        print("Fake changes saved")
    }
    
    // MARK: Logout
    func logout() async {
        // Simulación del proceso de logout
        print("Fake logged out")
        // Implementa la lógica fake para limpiar el estado de sesión aquí
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
