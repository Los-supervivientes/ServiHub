//
//  RootStatus.swift
//  ServiHub
//
//  Created by Diego Andrades on 4/7/24.
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
