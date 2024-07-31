//
//  OptionsView.swift
//  ServiHub
//
//  Created by Rocio Martos on 17/7/24.
//

import SwiftUI

struct OptionsView: View {
    @StateObject private var viewModel: OptionsViewModel
    @State private var showingSheet = false
    @State private var sheetTitle = ""
    @Environment(\.dismiss) var dismiss
    
    init(viewModel: OptionsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                // Imagen de fondo
                Image("fondoLogin")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .leading, spacing: 16) {
                    // Título de la pantalla con engranaje
                    HStack {
                        Text("Opciones")
                            .font(Font.custom("Grandstander-Italic-VariableFont_wght", size: 36))
                            .foregroundColor(CustomColor.secundaryColor)
                            .background(CustomColor.colorLightUB)
                        
                        Spacer()
                        
                        Image(systemName: "gear")
                            .resizable()
                            .frame(width: 41, height: 38)
                            .foregroundColor(CustomColor.colorDarkBG)
                            .font(.system(size: 32))
                            .padding(.trailing, 16)
                    }
                    .padding(.leading, 16)
                    .padding(.top, 16)
                    
                    // Contenido del perfil
                    VStack(alignment: .leading, spacing: 16) {
                        // Título del perfil
                        Text("Perfil")
                            .font(
                                Font.custom("SF Compact Display", size: 26)
                                    .weight(.bold)
                            )
                            .foregroundColor(CustomColor.colorPrimaryDarken)
                            .padding(.horizontal, 16)
                        
                        // Botones del perfil
                        VStack(alignment: .leading, spacing: 16) {
                            // Botón para cambiar nombre de usuario
                            Button(action: {
                                sheetTitle = "Cambiar nombre de usuario"
                                showingSheet = true
                            }) {
                                HStack(spacing: 8) {
                                    Image(systemName: "person")
                                        .foregroundColor(CustomColor.secundaryColor)
                                        .frame(width: 22, height: 22)
                                        .padding(.leading, 16)
                                    
                                    Text("Cambiar nombre de usuario")
                                        .font(Font.custom("SF Compact Display", size: 18))
                                        .foregroundColor(CustomColor.secundaryColor)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.horizontal, 8)
                                }
                            }
                            Divider()
                            
                            // Botón para cambiar email
                            Button(action: {
                                sheetTitle = "Cambiar email"
                                showingSheet = true
                            }) {
                                HStack(spacing: 8) {
                                    Image(systemName: "envelope")
                                        .foregroundColor(CustomColor.secundaryColor)
                                        .frame(width: 22, height: 22)
                                        .padding(.leading, 16)
                                    
                                    Text("Cambiar email")
                                        .font(Font.custom("SF Compact Display", size: 18))
                                        .foregroundColor(CustomColor.secundaryColor)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.horizontal, 8)
                                }
                            }
                            Divider()
                            
                            // Botón para cambiar contraseña
                            Button(action: {
                                sheetTitle = "Cambiar contraseña"
                                showingSheet = true
                            }) {
                                HStack(spacing: 8) {
                                    Image(systemName: "lock")
                                        .foregroundColor(CustomColor.secundaryColor)
                                        .frame(width: 22, height: 22)
                                        .padding(.leading, 16)
                                    
                                    Text("Cambiar contraseña")
                                        .font(Font.custom("SF Compact Display", size: 18))
                                        .foregroundColor(CustomColor.secundaryColor)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.horizontal, 8)
                                }
                            }
                        }
                        Divider()
                        
                        Text("Notificaciones")
                            .font(
                                Font.custom("SF Compact Display", size: 26)
                                    .weight(.bold)
                            )
                            .foregroundColor(CustomColor.colorPrimaryDarken)
                            .padding(.horizontal, 16)
                        Divider()
                        
                        // Opción: Notificaciones
                        HStack {
                            Image(systemName: "bell.circle")
                                .foregroundColor(CustomColor.secundaryColor)
                                .frame(width: 22, height: 22)
                                .padding(.leading, 16)
                            
                            Text("Notificaciones")
                                .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .leading)
                                .padding(0)
                                .foregroundColor(CustomColor.secundaryColor)
                            
                            
                            Spacer()
                            
                            Toggle("", isOn: $viewModel.notificationsEnabled)
                                .toggleStyle(SwitchToggleStyle(tint: Color.blue))
                                .padding(.trailing, 16)
                        }
                        Divider()
                        
                        // Opción: Face ID
                        HStack {
                            Image(systemName: "camera.circle")
                                .foregroundColor(CustomColor.secundaryColor)
                                .frame(width: 22, height: 22)
                                .padding(.leading, 16)
                            
                            Text("Face ID")
                                .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .leading)
                                .padding(0)
                                .foregroundColor(CustomColor.secundaryColor)
                            
                            Spacer()
                            
                            Toggle("", isOn: $viewModel.faceIDEnabled)
                                .toggleStyle(SwitchToggleStyle(tint: Color.blue))
                                .padding(.trailing, 16)
                        }
                        Divider()
                        
                        // Botones de "Guardar" y "Logout"
                        HStack {
                            Spacer()
                            
                            HStack(spacing: 16) {
                                Button(action: {
                                    viewModel.saveChanges()
                                    dismiss()
                                }) {
                                    Text("Guardar")
                                        .font(Font.custom("SF Compact Display", size: 18))
                                        .foregroundColor(.white)
                                        .frame(width: 130, height: 50)
                                        .background(Color(red: 0.63, green: 0.62, blue: 0.77))
                                        .cornerRadius(10)
                                }
                                
                                Button(action: {
                                    viewModel.logout()
                                    dismiss()
                                }) {
                                    Text("Logout")
                                        .font(Font.custom("SF Compact Display", size: 18))
                                        .foregroundColor(.white)
                                        .frame(width: 130, height: 50)
                                        .background(Color(red: 0.87, green: 0.63, blue: 0.63))
                                        .cornerRadius(10)
                                }
                            }
                            
                            Spacer()
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 16)
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 8)
                    
                    Spacer()
                    if viewModel.isProfessional {
                        Button(action: {
                            // Acción para darse de baja como profesional
                            viewModel.unsubscribeAsProfessional()
                        }) {
                            HStack {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.red)
                                    .frame(width: 22, height: 22)
                                
                                Text("Darse de baja como profesional")
                                    .font(Font.custom("SF Compact Display", size: 18))
                                    .foregroundColor(.red)
                            }
                            .padding(.horizontal, 16)
                        }
                    }
                    Spacer()
                }
               
                
                .background(CustomColor.colorLightUB)
                .cornerRadius(20)
                .padding(.horizontal, 16)
                .padding(.top, 16)
            }
            .sheet(isPresented: $showingSheet) {
                SheetContentView(viewModel: viewModel, sheetTitle: sheetTitle)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}


// #Preview
#Preview {
    OptionsView(viewModel: OptionsViewModel(useCase: OptionsUseCaseFake()))
}
