//
//  RootView.swift
//  ServiHub
//
//  Created by EquipoSupervivientes!! on 4/7/24.
//

import SwiftUI

//MARK: - Creamos el enrutador de vistas

struct RootView: View {
    
    @EnvironmentObject var vm: RootViewModel
    
    var body: some View {

        switch(vm.status){
        case .initial:
            // Vista de login
            LoginView()
        case .loading:
            // Vista de carga de datos
            LoadingView()
        case .register:
            // Vista registro usuario/empresa
            RegisterView()
        case .error(error: let errorString):
//            ErrorView(error: errorString)
            Text("Error")
        case .loaded:
            // Vista pantalla home
            HomeView()
        }
    }
}



#Preview {
    RootView()
        .environmentObject(RootViewModel())
}
