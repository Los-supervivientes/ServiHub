//
//  RegisterViewModel.swift
//  ServiHub
//
//  Created by Diego Andrades on 4/7/24.
//


import Foundation

final class RegisterViewModel: ObservableObject{
    
    @Published var categories: [CategoriesModel]?
    private var registerUseCase: RegisterUseCaseProtocol
    
    private var network: CategoriesUseCaseProtocol
    
    init(network: CategoriesUseCaseProtocol = CategoriesUseCase(), registerUseCase: RegisterUseCaseProtocol = RegisterUseCase()) {
        self.network = network
        self.registerUseCase = registerUseCase
        
        /// Leemos los datos al inicializar
        getServices()
    }

    
    ///Función para cargar la lista de Servicios al llamar a la vista
    func getServices(){
        Task{
            let data = await network.getCategories()
            DispatchQueue.main.async {
                self.categories = data
            }
        }
    }
    
    
    //MARK: - onRegisterButton
    func onRegisterButton(typeUser: Bool, name: String?, firstSurname: String?, secondSurname: String?, mobile: String?, email: String?, password: String?, street: String?, city: String?, state: String?, postalCode: String?, country: String?, categoryBusiness: String?, companyName: String?, nif: String?) -> String{
        
        
        
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
        
        guard let companyName = companyName, isValid(genericTextField: companyName), !typeUser else {
            return "Error campo companyName Vacio"
        }
        guard let nif = nif, isValid(genericTextField: nif), !typeUser else {
            return "Error campo nif Vacio"
        }
        guard let street = street, isValid(genericTextField: street), !typeUser else {
            return "Error campo street Vacio"
        }
        guard let city = city, isValid(genericTextField: city), !typeUser else {
            return "Error campo city Vacio"
        }
        guard let state = state, isValid(genericTextField: state), !typeUser else {
            return "Error campo state Vacio"
        }
        guard let postalCode = postalCode, isValid(genericTextField: postalCode), !typeUser else {
            return "Error campo postalCode Vacio"
        }
        guard let country = country, isValid(genericTextField: country), !typeUser else {
            return "Error campo country Vacio"
            
        }
        //            self.rootStatus = .loading
        RegisterApp(typeUser: typeUser, name: name, firstSurname: firstSurname, secondSurname: secondSurname, mobile: mobile, email: email, password: password, street: street, city: city, state: state, postalCode: postalCode, country: country, categoryBusiness: categoryBusiness ?? "", companyName: companyName, nif: nif)
        
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
                let result = try await registerUseCase.RegisterApp(typeUser: typeUser, name: name, firstSurname: firstSurname, secondSurname: secondSurname, mobile: mobile, email: email, password: password, street: street, city: city, state: state, postalCode: postalCode, country: country, categoryBusiness: categoryBusiness, companyName: companyName, nif: nif)
                
                if !result.isEmpty {
                    DispatchQueue.main.async {
                        // Actualiza el estado de la raíz a .loaded o realiza cualquier otra acción necesaria
                        // self.rootStatus = .loaded
                    }
                } else {
                    // Maneja el caso en que el resultado esté vacío, si es necesario
                    print("El resultado está vacío")
                }
            } catch {
                // self.rootStatus = .initial
                
            }
        }
    }
    
}
