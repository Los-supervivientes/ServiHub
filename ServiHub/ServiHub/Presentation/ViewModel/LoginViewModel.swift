//
//  RootViewModel.swift
//  ServiHub
//
//  Created by Diego Andrades on 4/7/24.
//

import Foundation

final class LoginViewModel: ObservableObject {
    
    @Published var rootStatus: RootStatus = .initial
//    @Published var isLogged: Bool = false
    
   
    private var loginUseCase: LoginUseCaseProtocol
    
    //MARK: - Inits
    init(loginUseCase: LoginUseCaseProtocol = LoginUseCase()) {
        self.loginUseCase = loginUseCase
    }
    
    //MARK: - OnLoginButton
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
        password.isEmpty == false && password.count >= 4
    }
    
    //MARK: - LoginApp
    public func loginApp(user: String, password: String) {
        Task {
            do {
                if ( try await loginUseCase.loginApp(user: user, password: password)) {
                    DispatchQueue.main.async {
                        self.rootStatus = .loaded
                    }
                }
            } catch {
                self.rootStatus = .initial
               
            }
        }
    }
    
    //MARK: - ValidateLogin
    func validateControlLogin() {
        Task {
            if (await loginUseCase.validateToken()) {
                self.rootStatus = .loaded
            } else {
                self.rootStatus = .initial
            }
        }
    }
    
    //MARK: - CloseSessionUser
    func closeSessionUser() {
        Task {
            await loginUseCase.logout()
            self.rootStatus = .initial
        }
    }
}

