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
        
        let urlCad = "\(ConstantsApp.CONST_API_URL)\(HTTPEndPoints.categories.rawValue)"
        var request = URLRequest(url: URL(string:urlCad)!)
        request.httpMethod = HTTPMethods.get
        request.addValue(ConstantsApp.API_KEY, forHTTPHeaderField: "SSH-ApiKey")
        request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        

        //Llamamos al servidor

        do{
            let(data, response)  = try await URLSession.shared.data(for: request)
            if let resp = response as? HTTPURLResponse{
                if resp.statusCode == HTTPResponseCodes.SUCESS{
                    
                    modelReturn = (try! JSONDecoder().decode([CategoriesModel].self, from: data))
                }
            }
        }catch{
            print("error peticion")
        }
        
        return modelReturn
    }
}

///Clase fake de Categorias para pruebas y test
public final class NetworkCategoriesFake: NetworkCategoriesProtocol {
    public init(){}
    func getCategories() async -> [CategoriesModel] {
        let categories =  [ CategoriesModel(
                                          id: "",
                                          name: "Hogar y Jardín")
      ]
        
        return categories
    }
}



