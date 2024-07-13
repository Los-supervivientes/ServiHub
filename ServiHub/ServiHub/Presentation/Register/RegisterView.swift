//
//  RegisterView.swift
//  ServiHub
//
//  Created by Macbook Pro on 7/7/24.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var rootViewModel: LoginViewModel
    
    private let secundaryColor = Color(red: 179/255, green: 176/255, blue: 217/255)
    private let colorLightUB = Color(red: 227/255, green: 252/255, blue: 255/255)
    
    var body: some View {
        
        ZStack{
            ///Creamos imagen de fondo
            Image(.fondoLogin)
                .resizable()
                .id(1)
            
            VStack{
                Spacer()
                ///Boton Efectuar Registro
                VStack{
                    Button {
                        ///Enviamos los datos y volvemos al login
                        
                        self.rootViewModel.rootStatus =  .initial
                    } label: {
                        
                        ///Definimos las propiedades del botón de registrame
                        Text("Register")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .frame(width: 204, height: 50)
                            .background(self.secundaryColor)
                            .cornerRadius(10)
                            .shadow(radius: 10,x:10, y:10)
                        
                    }
                    .id(5)
                    
                }
                .padding([.leading, .trailing], 20)
                
                ///Boton Efectuar Registro con id Apple
                VStack{
                    Button {
                        ///Enviamos los datos y volvemos al login
                        
                        self.rootViewModel.rootStatus =  .initial
                    } label: {
                        
                        ///Definimos las propiedades del botón registrame con id de Apple
                        HStack {
                            Image(.appleiconApple) // Icono a la izquierda
                                            .font(.title2)
                                            .foregroundStyle(.white)
                                            .frame(width: 21, height: 23)
                                            .offset(x: 24)
                            
                            Text("Register with Apple")
                                .font(.system(size: 17))
                                .foregroundStyle(.white)
                                .frame(width: 204, height: 50)
  
                        }
                        .background(self.secundaryColor)
                        .frame(width: 204, height: 50)
                        .cornerRadius(10)
                        .shadow(radius: 10, x: 10, y: 10)
                        
                    }
                    .padding(.top, 16)
                    .id(5)
                }
                
                
                ///Boton Efectuar Registro con id de google
                VStack{
                    Button {
                        ///Enviamos los datos y volvemos al login
                        
                        self.rootViewModel.rootStatus =  .initial
                    } label: {
                        
                        ///Definimos las propiedades del botón registrame con id de Apple
                        HStack {
                            Image(.iconGoogle) // Icono a la izquierda
                                            .font(.title2)
                                            .foregroundStyle(.white)
                                            .frame(width: 21, height: 23)
                                            .offset(x: 24)
                            
                            Text("Register with Google")
                                .font(.system(size: 17))
                                .foregroundStyle(.white)
                                .frame(width: 201, height: 48)
  
                        }
                        .background(self.secundaryColor)
                        .frame(width: 201, height: 48)
                        .cornerRadius(10)
                        .shadow(radius: 10, x: 10, y: 10)
                        
                    }
                    .padding(.top, 16)
                    .id(5)
                }
                
                Spacer()
                
                
            }
        }
        .ignoresSafeArea()
    }
}


#Preview {
  
    RegisterView()
            // Indicamos que se muestre la vista en modo día por defecto
        .preferredColorScheme(.light)

}
