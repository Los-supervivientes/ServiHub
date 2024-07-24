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
    @Published var isLoggedOut: Bool = false
    @Published var isProfessional: Bool = false
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""

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
                print("Error saving changes: \(error)")
            }
        }
    }
    
    func logout() {
        Task {
            await useCase.logout()
            DispatchQueue.main.async {
                self.isLoggedOut = true
            }
        }
    }

    func unsubscribeAsProfessional() {
        Task {
            do {
                try await useCase.unsubscribeAsProfessional()
                DispatchQueue.main.async {
                    self.isProfessional = false
                }
            } catch {
                print("Error unsubscribing: \(error)")
            }
        }
    }
}
