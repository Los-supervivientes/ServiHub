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
    @Published var isLoggedOut: Bool = false // Nueva propiedad para el estado de logout

    private var useCase: OptionsUseCaseProtocol
    private var cancellables = Set<AnyCancellable>()

    init(useCase: OptionsUseCaseProtocol) {
        self.useCase = useCase
    }

    func saveChanges() {
        Task {
            do {
                try await useCase.saveChanges(notificationsEnabled: notificationsEnabled, faceIDEnabled: faceIDEnabled)
            } catch {
                // Manejar errores, mostrar alertas, etc.
                print("Error saving changes: \(error)")
            }
        }
    }

    func logout() {
        Task {
            await useCase.logout()
            // Cambia el estado a 'logged out'
            DispatchQueue.main.async {
                self.isLoggedOut = true
            }
        }
    }
}
