//
//  RootStatus.swift
//  ServiHub
//
//  Created by EquipoSupervivientes!! on 4/7/24.
//

//MARK: - Creamos estados para el rootView
import Foundation

enum RootStatus {
    case initial
    case loading
    case loaded
    case register
    case error(error: String)
}
