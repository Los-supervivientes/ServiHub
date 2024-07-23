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
            AsyncImage(url: URL(string: service.imageURL)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Image(systemName: "person")
                    .resizable()
                    .scaledToFit()

            }
            
            Rectangle()
                .background(.black.opacity(0.15))
                .frame(width: 200, height: 20)
                .offset(y: 65)
                
            Text(service.name)
                .font(.headline)
                .foregroundStyle(.white)
                .offset(y: 65)
            
        }
        .frame(width: 200, height: 150)
        .background(.blue)
        .cornerRadius(20)
        .padding()
        
    }
}

#Preview {
    ServiceCardView(service: Service(id: UUID(), category: Category(id: UUID(), name: "Peluqueria"), name: "La puri", info: "Bienvenidos a la puri. Un luga increible", imageURL: "url"))
}
