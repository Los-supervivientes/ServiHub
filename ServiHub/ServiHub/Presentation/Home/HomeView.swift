//
//  HomeView.swift
//  ServiHub
//
//  Created Diego Andrades on 7/7/24.
//

import SwiftUI

//MARK: - Pantalla de Home

extension Double {
    func truncate(places : Int)-> Double {
        return Double(floor(pow(10.0, Double(places)) * self)/pow(10.0, Double(places)))
    }
}

struct HomeView: View {
    
    private let secundaryColor = Color(red: 179/255, green: 176/255, blue: 217/255)
    private let colorLightUB = Color(red: 227/255, green: 252/255, blue: 255/255)
    private let colorDarkBG = Color(red: 51/255, green: 75/255, blue: 108/255)
    private let colorPrimaryDarken = Color(red: 122/255, green: 154/255, blue: 199/255)
    private let colorTertiary = Color(red: 176/255, green: 213/255, blue: 217/255)
    
    @EnvironmentObject var rootViewModel: LoginViewModel
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(colorPrimaryDarken)
        UITabBar.appearance().unselectedItemTintColor = UIColor(colorTertiary)
        
    }
    
    var body: some View {
   
        ZStack{

            TabView {
                
                ZStack{

                    Image(.fondoLogin)
                        .resizable()

                    VStack{
                        Spacer()

                        HStack{
                            VStack{
                                Text("Home")
                                
                                    .foregroundColor(Color(red: 161/255, green: 158/255, blue: 198/255))
                                    .multilineTextAlignment(.leading)
                                    .padding(.leading, 20.0)
                                    .font(Font.custom("Grandstander-Italic-VariableFont_wght", size: 28))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            
                            Spacer()
                            
                            Button {
                                print("options")
                                
                            } label: {
                                
                                ///Definimos las propiedades del botón login
                                Image(systemName: "gear")
                                    .resizable()
                                    .frame(width: 41, height: 38)
                                
                                
                            }
                            .padding(.trailing, 20)
                            .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                            .id(5)
                        }
                        
                        ServiceRowView(rowTitle: "Peluqueria", title: "la puri", stars: 4, distance: 10.5)
                         
                      
                        ServiceRowView(rowTitle: "Restaurantes", title: "Le fine", stars: 40, distance: 500)
                        
                        ServiceRowView(rowTitle: "Abogados", title: "Judge Dreed", stars: 3, distance: 20)
                        
                        Spacer()

                        //                Rectangle()
                        //                    .fill(.red)
                        //                    .frame(width: .infinity, height: 100)
                        
                        
                        
                    }
                }
                .ignoresSafeArea()
                .tabItem {
                    Label("HOME",
                          systemImage: "house")
                    
                }
                
                
                Text("Chat")
                    .tabItem {
                        Label("CHAT",
                              systemImage: "envelope")
                    }
            }.accentColor(colorDarkBG)  
        }
    }
}

struct ServiceRowView: View {
    @State var rowTitle = ""
    @State var title = ""
    @State var stars = 0
    @State var distance = 0.0
    
    private let secundaryColor = Color(red: 179/255, green: 176/255, blue: 217/255)
    private let colorLightUB = Color(red: 227/255, green: 252/255, blue: 255/255)
    private let colorDarkBG = Color(red: 51/255, green: 75/255, blue: 108/255)
    private let colorPrimaryDarken = Color(red: 122/255, green: 154/255, blue: 199/255)
    private let colorTertiary = Color(red: 176/255, green: 213/255, blue: 217/255)
    var body: some View {
        VStack{
            Text(rowTitle)
                .foregroundColor(Color(colorPrimaryDarken))
            //.multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20.0)
                //.padding(.bottom, -30.0)
                .font(Font.custom("Grandstander-Italic-VariableFont_wght", size: 28))
            
            ScrollView(.horizontal) {
                // 2
                LazyHStack {

                    CardView(title: title, stars: stars, distance: distance)
                    CardView(title: title, stars: stars, distance: distance)
                    CardView(title: title, stars: stars, distance: distance)
                    
      
                }
            }
            
        }
       
    }
}

struct CardView: View {

    @State var title = ""
    @State var stars = 0
    @State var distance = 0.0
    var body: some View {
        VStack {
            
            ZStack {
                Image("Logo")
                
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 210, height: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                
                Text(title)
                    .font(.custom("Grandstander-Italic-VariableFont_wght", size: 12))
                    .foregroundColor(.white)
                //.multilineTextAlignment(.leading)
                    .frame(width: 200, height:1)
                    .padding()
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(10)
                    .offset(y: 70) // Ajusta la posición del texto según sea necesario
            }
            .frame(width: 210, height: 150)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            HStack {
                
                Image(systemName: "star")
                    .resizable()
                    .frame(width: 12, height: 12)
                Text("\(stars)(+500)")
                    .font(Font.custom("Grandstander-Italic-VariableFont_wght", size: 10))
                //Spacer()
                
                Image(systemName: "location")
                    .resizable()
                    .frame(width: 12, height:12)
                Text("\(String(format: "%.1f", distance))Km")
                    .font(Font.custom("Grandstander-Italic-VariableFont_wght", size: 10))
            }
            
        }
        .padding(.top, -110.0)
        .padding(.bottom, -110.0)
    }
}



#Preview {
    
    HomeView()
    // Indicamos que se muestre la vista en modo día por defecto
        .preferredColorScheme(.light)
    
}
