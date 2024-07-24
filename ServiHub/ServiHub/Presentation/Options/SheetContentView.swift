//
//  SheetContentView.swift
//  ServiHub
//
//  Created by Rocio Martos on 24/7/24.
//

import SwiftUI

struct SheetContentView: View {
    @StateObject var viewModel: OptionsViewModel
    var sheetTitle: String
    
    var body: some View {
        NavigationView {
            Form {
                if sheetTitle == "Cambiar nombre de usuario" {
                    Section(header: Text("Nombre de usuario")) {
                        TextField("Nombre de usuario", text: $viewModel.username)
                            .autocapitalization(.none)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                } else if sheetTitle == "Cambiar email" {
                    Section(header: Text("Email")) {
                        TextField("Email", text: $viewModel.email)
                            .autocapitalization(.none)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.emailAddress)
                    }
                } else if sheetTitle == "Cambiar contraseña" {
                    Section(header: Text("Contraseña")) {
                        SecureField("Contraseña", text: $viewModel.password)
                            .textContentType(.newPassword)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                }
            }
            .navigationTitle(sheetTitle)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") {
                        // Close the sheet
                        viewModel.username = ""
                        viewModel.email = ""
                        viewModel.password = ""
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Guardar") {
                        // Save changes based on sheetTitle
                        if sheetTitle == "Cambiar nombre de usuario" {
                            // Save username
                            print("Nuevo nombre de usuario: \(viewModel.username)")
                        } else if sheetTitle == "Cambiar email" {
                            // Save email
                            print("Nuevo email: \(viewModel.email)")
                        } else if sheetTitle == "Cambiar contraseña" {
                            // Save password
                            print("Nueva contraseña: \(viewModel.password)")
                        }
                    }
                }
            }
        }
    }
}
