//
//  CustomField.swift
//  ServiHub
//
//  Created by Diego Andrades on 16/7/24.
//

import SwiftUI

struct CustomField: View {
    @Binding var text: String
    var icon: Image
    var placeholder: String
    var borderColor: Color
    var textColor: Color
    
    var body: some View {
        VStack {
            HStack {
                icon
                    .frame(width: 24, height: 25) // Tamaño del icono
                
                TextField(placeholder, text: $text)
                    .foregroundColor(textColor) // Color del texto
                    .autocorrectionDisabled() // Anulamos autocorrección
                    .autocapitalization(.none) // Para que no ponga por defecto la primera letra en mayúscula
                    .background(Color.clear) // Fondo transparente
            }
            .frame(width: 326, height: 35)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(borderColor, lineWidth: 2) // Borde del color secundario
                    .frame(height:2) // Altura del borde inferior
                    .padding(.top, 30) // Espacio para que quede alineado con el texto
            )
        }
    }
}

