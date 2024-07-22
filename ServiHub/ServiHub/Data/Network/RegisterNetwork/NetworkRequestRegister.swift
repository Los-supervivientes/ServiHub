//
//  NetworkRequestRegister.swift
//  ServiHub
//
//  Created by Diego Andrades 22/7/24.
//

import Foundation

// MARK: - NetworkRequestRegister
struct NetworkRequestRegister {
    
    
    // MARK: Request For Register
    func requestForRegister(typeUser: Bool, name: String, firstSurname: String, secondSurname: String?, mobile: String, email: String
                            , password: String, street: String, city: String, state: String, postalCode: String, country: String
                            , categoryBusiness: String, companyName: String, nif: String) async throws -> URLRequest {
            
        var typeRegister : HTTPEndPoints
        var jsonEncoder : Data
    

        if typeUser {
            ///Formamos la url para el registro de un usuario
            typeRegister = HTTPEndPoints.registerUser

        }else {
            ///Formamos la url para el registro de un profesional
            typeRegister = HTTPEndPoints.registerProf
        }
        
        guard let url = URL(string: "\(ConstantsApp.CONST_API_URL)\(typeRegister.rawValue)") else {
            throw NetworkError.malformedURL
        }
        
        //Introduzco los datos en el modelo
        if typeRegister == HTTPEndPoints.registerUser {
            var data = [RegisterModel.RegisterUserModel]()
            data.append(RegisterModel.RegisterUserModel(name: name,
                                                        firstSurname: firstSurname,
                                                        secondSurname: secondSurname ?? "",
                                                        mobile: mobile,
                                                        email: email,
                                                        password: password))
            
            jsonEncoder = try JSONEncoder().encode(data)
        }else{
            var data = [RegisterModel.RegisterProfModel]()
            data.append(RegisterModel.RegisterProfModel(name: name,
                                                        firstSurname: firstSurname,
                                                        secondSurname: secondSurname ?? "",
                                                        mobile: mobile,
                                                        email: email,
                                                        password: password,
                                                        street: street,
                                                        city: city,
                                                        state: state,
                                                        postalCode: postalCode,
                                                        country: country,
                                                        categoryBusiness: categoryBusiness,
                                                        companyName: companyName,
                                                        nif: nif))
            jsonEncoder = try JSONEncoder().encode(data)
        }
        
        /// Creamos la request
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethods.post
        request.addValue(ConstantsApp.API_KEY, forHTTPHeaderField: "SSH-ApiKey")
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpBody =  jsonEncoder
        return request
    }
}





