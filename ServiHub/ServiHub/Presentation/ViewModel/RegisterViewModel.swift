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
    
}
