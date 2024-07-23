//
//  OptionViewModel.swift
//  ServiHub
//
//  Created by Rocio Martos on 22/7/24.
//

import Foundation
import Combine


class OptionsViewModel: ObservableObject {
    @Published var notificationsEnabled: Bool = false
    @Published var faceIDEnabled: Bool = false
    
    private var useCase: OptionsUseCaseProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(useCase: OptionsUseCaseProtocol) {
        self.useCase = useCase
    }
    
    func saveChanges() {
        Task {
            do {
                try await useCase.saveChanges()
            } catch {
                // Manejar errores, mostrar alertas, etc.
                print("Error saving changes: \(error)")
            }
        }
    }
    
    func logout() {
        Task {
            await useCase.logout()
            //Añdimos la lógica adicional después de hacer logout, como redirigir al usuario
        }
    }
}
