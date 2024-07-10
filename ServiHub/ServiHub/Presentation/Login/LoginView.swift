//
//  LoginView.swift
//  ServiHub
//
//  Created by EquipoSupervivientes!! on 4/7/24.
//

import SwiftUI

//MARK: - LoginView
struct LoginView: View {
    
    @EnvironmentObject var rootViewModel: RootViewModel
    //Asignamos variables de prueba
    @State private var email = "die_94_gohotmail.com"
    @State private var password = "1"
    
    var body: some View {
        ZStack{
            ///Creamos imagen de fondo
            Image(.fondoLogin)
                .resizable()
                .id(1)
            
            VStack{
                Spacer()
                VStack{
                    
                    VStack{
                        
                        ///Imagen logo
                        Image(.logo)
                            .resizable()
                            .frame(width: 200, height: 200)
                            .foregroundColor(.white)
                            .padding()
                            .id(2)
                        
                    }
                    
                    ///Campo de texto para añadir el email
                    TextField("Email", text: self.$email)
                        .padding()
                        .background(.white)
                        .foregroundStyle(.blue)
                        .cornerRadius(10)
                        .autocorrectionDisabled()
                        .shadow(radius: 10, x: 20, y: 10)
                        .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                        .id(3)
                    
                    
                    ///Campo de texto para añadir la password
                    SecureField("Password", text: self.$password)
                        .padding()
                        .background(.white)
                        .foregroundStyle(.blue)
                        .cornerRadius(10)
                        .autocorrectionDisabled()
                        .shadow(radius: 10, x: 20, y: 10)
                        .opacity(0.8)
                        .padding(.top, 25)
                        .id(4)
                    
                   
                    ///Botón de login
                    Button {
                        //Hacemos login en el VM
                        rootViewModel.onLoginButton(email: email, password: password)
                        
                    } label: {
                        
                        ///Definimos las propiedades del botón login
                        Text("Entrar")
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
                    
                    
                    ///Boton para ir a la pantalla de registro
                    HStack{
                        Text("¿No tienes cuenta?")
                            .foregroundStyle(.white)
                            .bold()
                        
                        Button(action: {
                            //Cambiamos a la pantalla de degistro
                            self.rootViewModel.rootStatus = .register
                        }, label: {
                            Text("Registrate")
                                .foregroundStyle(.blue)
                        })
                        .id(6)
                    }
                    .padding(.top, 20)
                    
                }
                .padding([.leading, .trailing], 20)
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
  
        LoginView()
            // Indicamos que se muestre la vista en modo día por defecto
        .preferredColorScheme(.light)

}
    
