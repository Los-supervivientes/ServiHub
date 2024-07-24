//
//  RootView.swift
//  ServiHub
//
//  Created by Diego Andrades on 4/7/24.
//

import SwiftUI

//MARK: - Creamos el enrutador de vistas

struct RootView: View {
    
    @EnvironmentObject var vm: LoginViewModel
    
    var body: some View {

        switch(vm.rootStatus){
        case .initial:
            // Vista de login
            LoginView()
        case .loading:
            // Vista de carga de datos
            LoadingView()
        case .register:
            // Vista registro usuario/empresa
            RegisterView(viewModel: RegisterViewModel(rootViewModel: vm))
        case .loaded:
            // Vista pantalla home
            HomeView()
        }
    }
}



#Preview {
    RootView()
        .environmentObject(LoginViewModel())
}
