//
//  ServiceCardView.swift
//  ServiHub
//
//  Created by Alejandro Alberto Gavira García on 23/7/24.
//

import SwiftUI

struct ServiceCardView: View {
    var service: Service
    
    var body: some View {
        ZStack {
            Image ("\(service.imageURL)")
                .resizable()
                .scaledToFill()
            
            Rectangle()
                .frame(width: 250, height: 30)
                .foregroundColor(.black.opacity(0.6))
                .offset(y: 80)
                
            Text(service.name)
                .font(.headline)
                .foregroundStyle(.white)
                .offset(y: 80)
            
        }
        .frame(width: 250, height: 188)
        .background(.clear)
        .cornerRadius(20)
        .padding()
        
    }
}

#Preview {
    ServiceCardView(service: Service(id: UUID(), category: Category(id: UUID(), name: "Peluqueria"), name: "La puri", info: "Bienvenidos a la puri. Un luga increible", imageURL: "3"))
}
