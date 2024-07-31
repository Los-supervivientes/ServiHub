//
//  ErrorView.swift
//  ServiHub
//
//  Created by Jose Bueno Cruz on 20/7/24.
//

import SwiftUI

struct ErrorView: View {
    
    // MARK: Properties
    var error: String
    var closure: (() -> Void)?
    
    // MARK: View
    var body: some View {
        ZStack {
            Image(.fondoLogin)
                .resizable()
            
            VStack {
                VStack {
                    Image(.logo)
                        .resizable()
                        .frame(width: 164, height: 165)
                        .foregroundColor(.white)
                }
                
                Spacer()
                        .frame(height: 97)
                
                errorContent
                
            }
            
        }
        .ignoresSafeArea()
    }
    
    private var errorContent: some View {
        ZStack {
            Image(.fondoLogin)
                .resizable()
                .opacity(0.9)
            
            VStack {
                Text("\(error)")
                    .font(.title2)
                    .foregroundColor(CustomColor.colorLightUB)
                    .bold()
                
                Divider()
                    .frame(height: 2)
                    .overlay(CustomColor.secundaryColor)
                
                Button {
                    closure?()
                } label: {
                    
                    Text("Close")
                        .font(.title2)
                        .foregroundStyle(CustomColor.colorLightUB)
                        .bold()
                        .frame(width: 146, height: 50)
                        .background(CustomColor.secundaryColor)
                        .cornerRadius(10)
                        .shadow(radius: 10,x:10, y:10)
                        
                }
                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
    
                
            }
        }
        .frame(width: UIScreen.main.bounds.width - 48, height: 180)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(CustomColor.colorLightUB,
                        lineWidth: 5)
        )
        .cornerRadius(12)
        .clipped()
    }
}

#Preview {
    ErrorView(error: "Test Error")
}
