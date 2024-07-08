//
//  RootViewModel.swift
//  ServiHub
//
//  Created by EquipoSupervivientes!! on 4/7/24.
//

import Foundation

final class RootViewModel: ObservableObject {
    
    @Published var status = Status.initial
    @Published var isLogged: Bool = false
    
    
}
