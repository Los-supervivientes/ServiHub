//
//  LoadingView.swift
//  ServiHub
//
//  Created by Diego Andrades on 4/7/24.
//

import SwiftUI

//MARK: - Pantalla de carga

struct LoadingView: View {
    var body: some View {
        ZStack{
            ///Imagen de fondo
            Image(.fondoLoading)
                .resizable()
                .id(1)
            VStack{
                
                VStack{
                    ///Imagen logo
                    Image(.logo)
                        .resizable()
                        .frame(width: 164, height: 165)
                        .foregroundColor(.white)
                        .padding()
                        .id(2)
                }
                
                ///Creamos Spinner de carga y añadimos un texto
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: Color(red: 161/255, green: 158/255, blue: 198/255)))
                        .scaleEffect(2)
                        .padding()
                
                ///Creamos el texto
                Text("Loading...")
                            .foregroundColor(Color(red: 161/255, green: 158/255, blue: 198/255))
                            .padding()
                            .font(Font.custom("Grandstander-Italic-VariableFont_wght", size: 18))
                           

            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LoadingView()
}
