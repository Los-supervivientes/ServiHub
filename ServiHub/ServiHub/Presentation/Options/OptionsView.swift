//
//  OptionsView.swift
//  ServiHub
//
//  Created by Rocio Martos on 17/7/24.
//

import SwiftUI

struct OptionsView: View {
    @StateObject private var viewModel: OptionsViewModel
    @State private var shouldShowLogin = false // Estado para controlar la redirección a la pantalla de login

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
                            .foregroundColor(Color(red: 0.7, green: 0.69, blue: 0.85))
                            .background(.white)

                        Spacer()

                        Image(systemName: "gearshape")
                            .foregroundColor(Color(red: 0.7, green: 0.69, blue: 0.85))
                            .font(.system(size: 32)) // Ajusta el tamaño aquí
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
                            .foregroundColor(Color(red: 0.48, green: 0.6, blue: 0.78))
                            .padding(.horizontal, 16)

                        // Botones del perfil
                        VStack(alignment: .leading, spacing: 16) {
                            // Botón para cambiar nombre de usuario
                            Button(action: {
                                // Acción para cambiar nombre de usuario
                            }) {
                                HStack(spacing: 8) {
                                    Image(systemName: "person.circle")
                                        .foregroundColor(Color(red: 0.63, green: 0.62, blue: 0.77))
                                        .frame(width: 22, height: 22)
                                        .padding(.leading, 16)

                                    Text("Cambiar nombre de usuario")
                                        .font(Font.custom("SF Compact Display", size: 18))
                                        .foregroundColor(Color(red: 0.63, green: 0.62, blue: 0.77))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.horizontal, 8)
                                }
                            }
                            Divider()

                            // Botón para cambiar email
                            Button(action: {
                                // Acción para cambiar email
                            }) {
                                HStack(spacing: 8) {
                                    Image(systemName: "envelope")
                                        .foregroundColor(Color(red: 0.63, green: 0.62, blue: 0.77))
                                        .frame(width: 22, height: 22)
                                        .padding(.leading, 16)

                                    Text("Cambiar email")
                                        .font(Font.custom("SF Compact Display", size: 18))
                                        .foregroundColor(Color(red: 0.63, green: 0.62, blue: 0.77))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.horizontal, 8)
                                }
                            }
                            Divider()

                            // Botón para cambiar contraseña
                            Button(action: {
                                // Acción para cambiar contraseña
                            }) {
                                HStack(spacing: 8) {
                                    Image(systemName: "lock")
                                        .foregroundColor(Color(red: 0.63, green: 0.62, blue: 0.77))
                                        .frame(width: 22, height: 22)
                                        .padding(.leading, 16)

                                    Text("Cambiar contraseña")
                                        .font(Font.custom("SF Compact Display", size: 18))
                                        .foregroundColor(Color(red: 0.63, green: 0.62, blue: 0.77))
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
                            .foregroundColor(Color(red: 0.48, green: 0.6, blue: 0.78))
                            .padding(.horizontal, 16)
                        Divider()

                        // Opción: Notificaciones
                        HStack {
                            Image(systemName: "bell")
                                .foregroundColor(Color(red: 0.63, green: 0.62, blue: 0.77))
                                .frame(width: 22, height: 22)
                                .padding(.leading, 16)

                            Text("Notificaciones")
                                .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .leading)
                                .padding(0)
                                .foregroundColor(Color(red: 0.63, green: 0.62, blue: 0.77))

                            Spacer()

                            Toggle("", isOn: $viewModel.notificationsEnabled)
                                .toggleStyle(SwitchToggleStyle(tint: Color.blue))
                                .padding(.trailing, 16)
                        }
                        Divider()

                        // Opción: Face ID
                        HStack {
                            Image(systemName: "camera")
                                .foregroundColor(Color(red: 0.63, green: 0.62, blue: 0.77))
                                .frame(width: 22, height: 22)
                                .padding(.leading, 16)

                            Text("Face ID")
                                .frame(maxWidth: .infinity, minHeight: 22, maxHeight: 22, alignment: .leading)
                                .padding(0)
                                .foregroundColor(Color(red: 0.63, green: 0.62, blue: 0.77))

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
                }
                .background(Color.white)
                .cornerRadius(20)
                .padding(.horizontal, 16)
                .padding(.top, 16)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .onChange(of: viewModel.isLoggedOut) { isLoggedOut in
            shouldShowLogin = isLoggedOut
        }
        .fullScreenCover(isPresented: $shouldShowLogin) {
            LoginView()
        }
    }
}

// #Preview
#Preview {
    OptionsView(viewModel: OptionsViewModel(useCase: OptionsUseCaseFake()))
}
