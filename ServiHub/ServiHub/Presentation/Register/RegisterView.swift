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
    @State private var selectedItem: Int = 0
    @State var items: [String]
    

    
    
    var body: some View {
        
        ZStack{
            ///Creamos imagen de fondo
            Image(.fondoLogin)
                .resizable()
                .id(1)
            
            VStack{
               
                ///Boton Efectuar Registro
                ///
                VStack{
                    Toggle("",isOn: $typeUser)
                        .labelsHidden() // Oculta la etiqueta del Toggle
                        .toggleStyle(SwitchToggleStyle(tint: CustomColor.colorLightUB)) // Cambia el color del Toggle si deseas
                    if typeUser {
                        Text("Personal")
                            .foregroundStyle(CustomColor.colorLightUB)
                    }else{
                        Text("Profesional")
                            .foregroundStyle(CustomColor.colorDarkBG)
                    }
                }
                .padding(.top, 54)
                ScrollView{
                    VStack{
                        HStack{
                            Text("Info Básica")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .padding(.leading, 32)
                                .foregroundColor(CustomColor.colorPrimaryDarken)
                            Spacer()
                        }
                    }
                    .padding(.top, 54)
                    
                    
                    ///Campo de texto para añadir el Name
                    VStack {
                        CustomField(
                            text: $name, // Variable
                            icon: Image(.iconPerson), // Icono TextField
                            placeholder: "Name", // Texto de fondo
                            borderColor: CustomColor.secundaryColor, // Color del borde
                            textColor: CustomColor.secundaryColor // Color del texto
                        )
                    }
                    .padding(.top, 16)
                    
                    ///Campo de texto para añadir el SurName
                    VStack {
                        CustomField(
                            text: $firstSurname, // Variable
                            icon: Image(.iconPerson), // Icono TextField
                            placeholder: "SurName", // Texto de fondo
                            borderColor: CustomColor.secundaryColor, // Color del borde
                            textColor: CustomColor.secundaryColor // Color del texto
                        )
                    }
                    .padding(.top, 16)
                    
                    ///Campo de texto para añadir el secondSurname
                    VStack {
                        CustomField(
                            text: $secondSurname, // Variable
                            icon: Image(.iconPerson), // Icono TextField
                            placeholder: "Last Name (optional)", // Texto de fondo
                            borderColor: CustomColor.secundaryColor, // Color del borde
                            textColor: CustomColor.secundaryColor // Color del texto
                        )
                    }
                    .padding(.top, 16)
                    
                    ///Campo de texto para añadir el Mobile
                    VStack {
                        CustomField(
                            text: $mobile, // Variable
                            icon: Image(.iconPhone), // Icono TextField
                            placeholder: "Mobile", // Texto de fondo
                            borderColor: CustomColor.secundaryColor, // Color del borde
                            textColor: CustomColor.secundaryColor // Color del texto
                        )
                    }
                    .padding(.top, 16)
                    
                    
                    ///Campo de texto para añadir el email
                    VStack {
                        CustomField(
                            text: $email, // Variable
                            icon: Image(.iconEmail), // Icono TextField
                            placeholder: "Email", // Texto de fondo
                            borderColor: CustomColor.secundaryColor, // Color del borde
                            textColor: CustomColor.secundaryColor // Color del texto
                        )
                    }
                    .padding(.top, 16)
                    
                    ///Campo de texto para añadir el password
                    VStack {
                        CustomField(
                            text: $password, // Variable
                            icon: Image(.iconLock), // Icono TextField
                            placeholder: "Password", // Texto de fondo
                            borderColor: CustomColor.secundaryColor, // Color del borde
                            textColor: CustomColor.secundaryColor // Color del texto
                        )
                    }
                    .padding(.top, 16)
                    
                    /// Elegimos entre usuario o profesional
                    if !typeUser {
                        
                        VStack{
                            HStack{
                                Text("Info Profesional")
                                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    .padding(.leading, 32)
                                    .foregroundColor(CustomColor.colorPrimaryDarken)
                                Spacer()
                            }
                        }
                        .padding(.top, 54)
                        
                        VStack{
                            Picker("Selecciona una opción", selection: $selectedItem) {
                                ForEach(0..<items.count) { index in
                                    Text(self.items[index]).tag(index)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .frame(width: 326, height: 35)
                            .background(CustomColor.colorLightUB) // Fondo blanco
                            .cornerRadius(10)
                        }
                        
                        ///Campo de texto para añadir el Nombre del servicio
                        VStack {
                            CustomField(
                                text: $companyName, // Variable
                                icon: Image(.iconPerson), // Icono TextField
                                placeholder: "Name of service", // Texto de fondo
                                borderColor: CustomColor.secundaryColor, // Color del borde
                                textColor: CustomColor.secundaryColor // Color del texto
                            )
                        }
                        .padding(.top, 16)
                        
                        ///Campo de texto para añadir el NIF
                        VStack {
                            CustomField(
                                text: $nif, // Variable
                                icon: Image(.iconPerson), // Icono TextField
                                placeholder: "DNI/NIF", // Texto de fondo
                                borderColor: CustomColor.secundaryColor, // Color del borde
                                textColor: CustomColor.secundaryColor // Color del texto
                            )
                        }
                        .padding(.top, 16)
                        
                        ///Campo de texto para añadir la calle
                        VStack {
                            CustomField(
                                text: $street, // Variable
                                icon: Image(.iconLocation), // Icono TextField
                                placeholder: "Street", // Texto de fondo
                                borderColor: CustomColor.secundaryColor, // Color del borde
                                textColor: CustomColor.secundaryColor // Color del texto
                            )
                        }
                        .padding(.top, 16)
                        
                        
                        ///Campo de texto para añadir la ciudad
                        VStack {
                            CustomField(
                                text: $city, // Variable
                                icon: Image(.iconLocation), // Icono TextField
                                placeholder: "City", // Texto de fondo
                                borderColor: CustomColor.secundaryColor, // Color del borde
                                textColor: CustomColor.secundaryColor // Color del texto
                            )
                        }
                        .padding(.top, 16)
                        
                        ///Campo de texto para añadir el estado
                        VStack {
                            CustomField(
                                text: $state, // Variable
                                icon: Image(.iconLocation), // Icono TextField
                                placeholder: "State", // Texto de fondo
                                borderColor: CustomColor.secundaryColor, // Color del borde
                                textColor: CustomColor.secundaryColor // Color del texto
                            )
                        }
                        .padding(.top, 16)
                        
                        ///Campo de texto para añadir el código postal
                        VStack {
                            CustomField(
                                text: $postalCode, // Variable
                                icon: Image(.iconLocation), // Icono TextField
                                placeholder: "Postal Code", // Texto de fondo
                                borderColor: CustomColor.secundaryColor, // Color del borde
                                textColor: CustomColor.secundaryColor // Color del texto
                            )
                        }
                        .padding(.top, 16)
                        
                        ///Campo de texto para añadir el country
                        VStack {
                            CustomField(
                                text: $country, // Variable
                                icon: Image(.iconLocation), // Icono TextField
                                placeholder: "Country", // Texto de fondo
                                borderColor: CustomColor.secundaryColor, // Color del borde
                                textColor: CustomColor.secundaryColor // Color del texto
                            )
                        }
                        .padding(.top, 16)
                    }
                    
                    
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
                                .background(CustomColor.secundaryColor)
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
                            .background(CustomColor.secundaryColor)
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
                            .background(CustomColor.secundaryColor)
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
        }
        .ignoresSafeArea()
    }
    
}


#Preview {
    
    RegisterView(items: ["Abogado", "Restaurante", "Gimnasio", "Peluquería", "Dentista"])
    // Indicamos que se muestre la vista en modo día por defecto
        .preferredColorScheme(.light)
    
}
