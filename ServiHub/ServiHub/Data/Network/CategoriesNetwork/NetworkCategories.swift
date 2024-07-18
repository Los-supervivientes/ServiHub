//
//  NetworkCategories.swift
//  ServiHub
//
//  Created by Diego Andrades on 18/7/24.
//

import Foundation

protocol NetworkCategoriesProtocol {
    func getCategories() async -> [CategoriesModel]
}


final class NetworkCategories: NetworkCategoriesProtocol {
    func getCategories() async -> [CategoriesModel] {
        var modelReturn = [CategoriesModel]()
        
        let urlCad = "\(ConstantsApp.URL_API)\(HTTPEndPoints.categories.rawValue)"
        var request = URLRequest(url: URL(string:urlCad)!)
        request.httpMethod = HTTPMethods.get
//        request.addValue(HTTPMethods.content, forHTTPHeaderField: "Content-type")
        request.addValue("application/x-msgpack; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.addValue(ConstantsApp.APIKEY, forHTTPHeaderField: "SSH-ApiKey")
        

        //Llamamos al servidor

        do{
            let(data, response)  = try await URLSession.shared.data(for: request)
            if let resp = response as? HTTPURLResponse{
                if resp.statusCode == HTTPResponseCodes.SUCESS{
                    
                    modelReturn.append(try! JSONDecoder().decode(CategoriesModel.self, from: data))
                    
                }
            }
        }catch{
            print("error peticion")
        }
        
        print("Modelo: \(modelReturn)")
        return modelReturn
    }
}

///Clase fake de Categorias para pruebas y test
public final class NetworkCategoriesFake: NetworkCategoriesProtocol {
    public init(){}
    func getCategories() async -> [CategoriesModel] {
        let categories = CategoriesModel(
            description: "Categoría principal de Salud y Bienestar",
            id: "846B7F77-66AD-45AB-A9AC-A1FEE9890CAE",
            imageURL: "",
            name: "Salud y Bienestar")
        
        return [categories]
    }
}

