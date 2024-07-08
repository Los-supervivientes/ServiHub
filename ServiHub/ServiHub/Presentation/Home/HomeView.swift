//
//  HomeView.swift
//  ServiHub
//
//  Created by Macbook Pro on 7/7/24.
//

import SwiftUI

//MARK: - Pantalla de Home

struct HomeView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    
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
