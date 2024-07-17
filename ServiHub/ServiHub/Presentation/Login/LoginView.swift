//
//  LoginView.swift
//  ServiHub
//
//  Created by Diego Andrades on 4/7/24.
//

import SwiftUI

//MARK: - LoginView
struct LoginView: View {
    
    @EnvironmentObject var rootViewModel: LoginViewModel
    //Asignamos variables de prueba
    @State private var email = "die_94_go@hotmail.com"
    @State private var password = "12345678"
    @State private var error: String = ""
    
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
                    
                    ///Campo de texto para añadir el email
                    TextField("Email", text: self.$email)
                        .padding()
                        .background(self.colorLightUB)
                        .foregroundStyle(self.secundaryColor)
                        .frame(width: 325, height: 35)
                        .cornerRadius(10)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                        .shadow(radius: 10, x: 20, y: 10)
                        .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                        .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(self.secundaryColor, lineWidth: 2))
                        .padding(.top, 97)
                        .id(3)
                    
                    
                    ///Campo de texto para añadir la password
                    SecureField("Password", text: self.$password)
                        .padding()
                        .background(self.colorLightUB)
                        .foregroundStyle(self.secundaryColor)
                        .frame(width: 325, height: 35)
                        .cornerRadius(10)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                        .shadow(radius: 10, x: 20, y: 10)
                        .opacity(0.8)
                        .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(self.secundaryColor, lineWidth: 2))
                        .padding(.top, 16)
                        .id(4)
                    
                   
                    ///Botón de login
                    Button {
                        //Hacemos login en el VM
                        self.error = rootViewModel.onLoginButton(email: email, password: password)
                        
                    } label: {
                        
                        ///Definimos las propiedades del botón login
                        Text("Login")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .frame(width: 202, height: 50)
                            .background(self.secundaryColor)
                            .cornerRadius(10)
                            .shadow(radius: 10,x:10, y:10)
                            
                    }
                    .padding(.top, 32)
                    .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                    .id(5)
                    
                    
                    ///Boton para ir a la pantalla de registro
                    VStack{
                        Button(action: {
                            //Cambiamos a la pantalla de degistro
                            self.rootViewModel.rootStatus = .register
                        }, label: {
                            Text("or Register here")
                                .underline()
                                .foregroundStyle(Color(red: 122/255, green: 154/255, blue: 199/255))
                        })
                        .id(6)
                    }
                    .padding(.top, 16)
                    
                    
                    HStack{
                        if !self.error.isEmpty {
                            Text(self.error)
                                .foregroundStyle(.red)
                        }
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
    
