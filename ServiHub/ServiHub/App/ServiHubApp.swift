//
//  ServiHubApp.swift
//  ServiHub
//
//  Created by EquipoSupervivientes!! on 4/7/24.
///

import SwiftUI

@main
struct ServiHubApp: App {
    @StateObject var rootViewModel = LoginViewModel()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(rootViewModel)
        }
    }
}
