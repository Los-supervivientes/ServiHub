//
//  RegisterView.swift
//  ServiHub
//
//  Created by Diego Andrades on 7/7/24.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject var rootViewModel: LoginViewModel
    
    @State var typeUser: Bool = false
    
    /// Variables comunes
    @State private var name: String = ""
    @State private var firstSurname: String = ""
    @State private var secondSurname: String = ""
    @State private var mobile: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    ///Variables Negocio
    @State private var street: String = ""
    @State private var city: String = ""
    @State private var state: String = ""
    @State private var postalCode: String = ""
    @State private var country: String = ""
    @State private var categiryBusiness: String = ""
    @State private var companyName: String = ""
    @State private var nif: String = ""
    
    private let secundaryColor = Color(red: 179/255, green: 176/255, blue: 217/255)
    private let colorLightUB = Color(red: 227/255, green: 252/255, blue: 255/255)
    private let colorDarkBG = Color(red: 51/255, green: 75/255, blue: 108/255)
    
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
                    Toggle("",isOn: $typeUser)
                        .labelsHidden() // Oculta la etiqueta del Toggle
                        .toggleStyle(SwitchToggleStyle(tint: self.colorLightUB)) // Cambia el color del Toggle si deseas
                    if typeUser {
                        Text("Personal")
                            .foregroundStyle(self.colorLightUB)
                    }else{
                        Text("Profesional")
                            .foregroundStyle(self.colorDarkBG)
                    }
                }
                
                
                ///Campo de texto para añadir el Name
                VStack {
                    HStack() {
                        Image(.iconPerson) // Icono a la izquierda
                            .frame(width: 24, height: 25)
                            .id(0)
                        
                        TextField("Name", text: self.$name)
                            .foregroundStyle(self.secundaryColor) // Color del texto
                            .autocorrectionDisabled()
                            .background(Color.clear) // Fondo transparente
                            .id(0)
                    }
                    .foregroundColor(.blue)
                    .frame(width: 326, height: 35)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(self.secundaryColor, lineWidth: 2) // Borde del color secundario
                            .frame(height: 2) // Altura del borde inferior
                            .padding(.top, 33) // Espacio para que quede alineado con el texto
                        
                    )
                }
                .padding(.top, 36)
                
                ///Campo de texto para añadir el SurName
                VStack {
                    HStack() {
                        Image(.iconPerson) // Icono a la izquierda
                            .frame(width: 24, height: 25)
                            .id(0)
                        
                        TextField("SurName", text: self.$firstSurname)
                            .foregroundStyle(self.secundaryColor) // Color del texto
                            .autocorrectionDisabled()
                            .background(Color.clear) // Fondo transparente
                            .id(0)
                    }
                    .frame(width: 326, height: 35)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(self.secundaryColor, lineWidth: 2) // Borde del color secundario
                            .frame(height: 2) // Altura del borde inferior
                            .padding(.top, 33) // Espacio para que quede alineado con el texto
                        
                    )
                }
                .padding(.top, 16)
                
                ///Campo de texto para añadir el secondSurname
                VStack {
                    HStack() {
                        Image(.iconPerson) // Icono a la izquierda
                            .frame(width: 24, height: 25)
                            .id(0)
                        
                        TextField("Last Name (optional)", text: self.$secondSurname)
                            .foregroundStyle(self.secundaryColor) // Color del texto
                            .autocorrectionDisabled()
                            .background(Color.clear) // Fondo transparente
                            .id(0)
                    }
                    .frame(width: 326, height: 35)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(self.secundaryColor, lineWidth: 2) // Borde del color secundario
                            .frame(height: 2) // Altura del borde inferior
                            .padding(.top, 33) // Espacio para que quede alineado con el texto
                        
                    )
                }
                .padding(.top, 16)
                
                ///Campo de texto para añadir el Mobile
                VStack {
                    HStack() {
                        Image(.iconPhone) // Icono a la izquierda
                            .frame(width: 24, height: 25)
                            .id(0)
                        
                        TextField("Mobile", text: self.$mobile)
                            .foregroundStyle(self.secundaryColor) // Color del texto
                            .autocorrectionDisabled()
                            .background(Color.clear) // Fondo transparente
                            .id(0)
                    }
                    .frame(width: 326, height: 35)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(self.secundaryColor, lineWidth: 2) // Borde del color secundario
                            .frame(height: 2) // Altura del borde inferior
                            .padding(.top, 33) // Espacio para que quede alineado con el texto
                        
                    )
                }
                .padding(.top, 16)
                
                ///Campo de texto para añadir el email
                VStack {
                    HStack() {
                        Image(.iconEmail) // Icono a la izquierda
                            .frame(width: 24, height: 25)
                            .id(0)
                        
                        TextField("Email", text: self.$email)
                            .foregroundStyle(self.secundaryColor) // Color del texto
                            .autocorrectionDisabled()
                            .background(Color.clear) // Fondo transparente
                            .id(0)
                    }
                    .frame(width: 326, height: 35)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(self.secundaryColor, lineWidth: 2) // Borde del color secundario
                            .frame(height: 2) // Altura del borde inferior
                            .padding(.top, 33) // Espacio para que quede alineado con el texto
                        
                    )
                }
                .padding(.top, 16)
                
                ///Campo de texto para añadir el password
                VStack {
                    HStack() {
                        Image(.iconLock) // Icono a la izquierd
                            .frame(width: 24, height: 25)
                            .id(0)
                        
                        TextField("Password", text: self.$password)
                            .foregroundStyle(self.secundaryColor) // Color del texto
                            .autocorrectionDisabled()
                            .background(Color.clear) // Fondo transparente
                            .id(0)
                    }
                    .frame(width: 326, height: 35)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(self.secundaryColor, lineWidth: 2) // Borde del color secundario
                            .frame(height: 2) // Altura del borde inferior
                            .padding(.top, 33) // Espacio para que quede alineado con el texto
                        
                    )
                }
                .padding(.top, 16)
                
                
                
                
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
                .padding(.top, 54)
                
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
                        
                        ///Definimos las propiedades del botón registrame con id de Google
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
                
                ///Boton para ir a la pantalla de registro
                VStack{
                    Button(action: {
                        //Cambiamos a la pantalla de degistro
                        self.rootViewModel.rootStatus = .initial
                    }, label: {
                        Text("or Signup here")
                            .underline()
                            .foregroundStyle(Color(red: 122/255, green: 154/255, blue: 199/255))
                    })
                    .id(6)
                }
                .padding(.top, 16)
                
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
