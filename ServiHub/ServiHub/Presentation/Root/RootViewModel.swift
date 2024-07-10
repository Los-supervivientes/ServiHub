//
//  RootViewModel.swift
//  ServiHub
//
//  Created by EquipoSupervivientes!! on 4/7/24.
//

import Foundation

final class RootViewModel: ObservableObject {
    
    @Published var rootStatus: RootStatus = .initial
//    @Published var isLogged: Bool = false
    
   
    private var loginUseCase: LoginUseCaseProtocol
    
    //MARK: - Inits
    init(loginUseCase: LoginUseCaseProtocol = LoginUseCase()) {
        self.loginUseCase = loginUseCase
    }
    
    //MARK: - OnLoginButton
    func onLoginButton(email: String?, password: String?) {
        self.rootStatus = .loading
        
        guard let email = email, isValid(email: email) else {
//            self.statusLogin = .showErrorEmail(NSLocalizedString("errorEmail", comment: "ErrorEmail"))
            return
        }
        guard let password = password, isValid(password: password) else {
//            self.statusLogin = .showErrorPassword(NSLocalizedString("errorPassword", comment: "ErrorPassword"))
            return
        }
        loginApp(user: email, password: password)
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
