//
//  RootViewModel.swift
//  ServiHub
//
//  Created by Diego Andrades on 4/7/24.
//

import Foundation

final class LoginViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var rootStatus: RootStatus = .initial
    private var loginUseCase: LoginUseCaseProtocol
    
    //MARK: - Inits
    init(loginUseCase: LoginUseCaseProtocol = LoginUseCase()) {
        self.loginUseCase = loginUseCase
        closeSessionUser()
        validateControlLogin()
    }
    
    //MARK: - OnLoginButton
    @MainActor 
    func onLoginButton(email: String?, password: String?) -> String{
        
        guard let email = email, isValid(email: email) else {
            return "Error verificando el email"
        }
        guard let password = password, isValid(password: password) else {
            return"Error verificando el password"
        }
        self.rootStatus = .loading
        loginApp(user: email, password: password)

        return ""
    }
      
    //MARK: - CheckEmail
    private func isValid(email: String) -> Bool {
        email.isEmpty == false && email.contains("@")
    }
    
    
    //MARK: - CheckPassword
    private func isValid(password: String) -> Bool {
        password.isEmpty == false && password.count >= 8
    }
    
    
    //MARK: - LoginApp
    @MainActor
    public func loginApp(user: String, password: String) {
        Task {
            do {
                if ( try await loginUseCase.loginApp(user: user, password: password)) {
                    self.rootStatus = .loaded
                }
            } catch {
                let errorMessage = errorMessage(for: error)
                self.rootStatus = .error(error: errorMessage)
               
            }
        }
        
    }
    

    //MARK: - ValidateLogin
    func validateControlLogin() {
        DispatchQueue.main.async {
            if self.loginUseCase.validateToken() {
                self.rootStatus = .loaded
            } else {
                self.rootStatus = .initial
            }
        }
    }
    
    
    //MARK: - CloseSessionUser
    func closeSessionUser() {
        DispatchQueue.main.async {
            self.loginUseCase.logout()
            self.rootStatus = .initial
        }
    }
}

