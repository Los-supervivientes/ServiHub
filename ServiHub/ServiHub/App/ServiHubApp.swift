//
//  ServiHubApp.swift
//  ServiHub
//
//  Created by EquipoSupervivientes!! on 4/7/24.
///

import SwiftUI

@main
struct ServiHubApp: App {
    @StateObject var rootViewModel = RootViewModel()
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(rootViewModel)
        }
    }
}
