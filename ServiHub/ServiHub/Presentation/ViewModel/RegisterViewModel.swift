//
//  RegisterViewModel.swift
//  ServiHub
//
//  Created by Diego Andrades on 4/7/24.
//


import Foundation

final class RegisterViewModel: ObservableObject{
    
    @Published var categories: [CategoriesModel]?
  
    
    private var network: CategoriesUseCaseProtocol
    
    init(network: CategoriesUseCaseProtocol = CategoriesUseCase()) {
        self.network = network
        //lanzamos la carga
        getServices()
    }
    
    ///Función para cargar la lista de Servicios al llamar a la vista
    func getServices() {
        Task{
            let data = await network.getCategories()
            DispatchQueue.main.async {
                self.categories = data
            }
        }
    }
    
    
        //MARK: - onRegisterButton
        func onRegisterButton(typeUser: Bool, name: String?, firstSurname: String?, secondSurname: String?, mobile: String?, email: String?
                              , password: String?, street: String?, city: String?, state: String?, postalCode: String?, country: String?
                              , categoryBusiness: String?, companyName: String?, nif: String?) -> String{
    
    

                guard let name = name, isValid(genericTextField: name) else {
                    return "Error campo Name Vacio"
                }
                guard let firstSurname = firstSurname, isValid(genericTextField: firstSurname) else {
                    return "Error campo firstSurname Vacio"
                }
                guard let mobile = mobile, isValid(genericTextField: mobile) else {
                    return "Error campo mobile Vacio"
                }
                guard let email = email, isValid(email: email) else {
                    return "Error verificando el email"
                }
                guard let password = password, isValid(password: password) else {
                    return"Error verificando el password"
                }
                if !typeUser {
                    guard let companyName = companyName, isValid(genericTextField: companyName) else {
                        return "Error campo companyName Vacio"
                    }
                    guard let nif = nif, isValid(genericTextField: nif) else {
                        return "Error campo nif Vacio"
                    }
                    guard let street = street, isValid(genericTextField: street) else {
                        return "Error campo street Vacio"
                    }
                    guard let city = city, isValid(genericTextField: city) else {
                        return "Error campo city Vacio"
                    }
                    guard let state = state, isValid(genericTextField: state) else {
                        return "Error campo state Vacio"
                    }
                    guard let postalCode = postalCode, isValid(genericTextField: postalCode) else {
                        return "Error campo postalCode Vacio"
                    }
                    guard let country = country, isValid(genericTextField: country) else {
                        return "Error campo country Vacio"
                    }
                }
 

//            self.rootStatus = .loading
//            loginApp(user: email, password: password)
            
    //            loginApp(user: email, password: password)
    
                return ""
            }
    
        //MARK: - CheckEmailRegister
        private func isValid(email: String) -> Bool {
            email.isEmpty == false && email.contains("@")
        }
    
        //MARK: - CheckPasswordRegister
        private func isValid(password: String) -> Bool {
            password.isEmpty == false && password.count >= 4
        }
    
        //MARK: - CheckGenericTextField
        private func isValid(genericTextField: String) -> Bool{
            genericTextField.isEmpty == false
        }
    
    //MARK: - RegisterApp
    public func RegisterApp(typeUser: Bool, name: String, firstSurname: String, secondSurname: String?, mobile: String, email: String
                            , password: String, street: String, city: String, state: String, postalCode: String, country: String
                            , categoryBusiness: String, companyName: String, nif: String) {
        Task {
            do {
                if ( try await loginUseCase.loginApp(user: user, password: password)) {
                    DispatchQueue.main.async {
//                        self.rootStatus = .loaded
                    }
                }
            } catch {
                self.rootStatus = .initial
               
            }
        }
    }
    
}
