//
//  RegisterView.swift
//  ServiHub
//
//  Created by Macbook Pro on 7/7/24.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    
    var body: some View {
        
            ZStack{
                ///Creamos imagen de fondo
                Image(.fondoLogin)
                    .resizable()
                    .id(1)
                
                VStack{
                    Spacer()
                    VStack{
                        ///Boton Efectuar Registro
                        Button {
                           //Enviamos los datos y volvemos al login
                            
                            self.rootViewModel.status =  .initial
                        } label: {
                            
                            ///Definimos las propiedades del botón de registrame
                            Text("Registrame")
                                .font(.title2)
                                .foregroundStyle(.white)
                                .frame(width: 300, height: 50)
                                .background(Color(red: 0, green: 0, blue: 96))
                                .cornerRadius(10)
                                .shadow(radius: 10,x:10, y:10)
                            
                        }
                        .padding(.top, 50)
                        .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                        .id(5)
                        
                    }
                    .padding([.leading, .trailing], 20)
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
