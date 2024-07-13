//
//  HomeView.swift
//  ServiHub
//
//  Created Diego Andrades on 7/7/24.
//

import SwiftUI

//MARK: - Pantalla de Home

struct HomeView: View {
    @EnvironmentObject var rootViewModel: LoginViewModel
    
    var body: some View {
        
            ZStack{
                ///Creamos imagen de fondo
                Image(.fondoLogin)
                    .resizable()
                    .id(1)
                VStack{
                    Text("HOME")
                    
                }
                
      
            }
            .ignoresSafeArea()
        }
    }


#Preview {
  
    HomeView()
            // Indicamos que se muestre la vista en modo día por defecto
        .preferredColorScheme(.light)

}
