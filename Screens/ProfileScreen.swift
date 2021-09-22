//
//  ProfileScreen.swift
//  Live It
//
//  Created by Rik Roy on 8/10/21.
//

import SwiftUI

struct ProfileScreen: View {
    var body: some View {
        VStack {
            ScrollView {
                Group {
                    Spacer().frame(height: 50)
                    
                    Image("Background1")
                        .renderingMode(.original)
                        .resizable()
                        .ignoresSafeArea(edges: .top)
                        .frame(height: 200)

                    CircleImage(image: Image("PersonIcon"))
                        .offset(y: -70)
                        .padding(.bottom, -130)
                        .frame(height:30)
                    
                    Spacer().frame(height: 90)
                    
                    Text("Ekendili Chukwu").font(.custom("DIN Alternate", size: 25))
                
                    Divider()
                    
                    Spacer().frame(height: 20)
                }
                
                Group {
                
                    DropdownView(thumbnail: Image("Settings"), title: Text("Profile Info"), view: "Settings")
                    
                    Divider()
                }
                
                Spacer()
            }
            
            /*
            Divider()
            
            HStack {
                Spacer().frame(width: 20)
                
                NavigationLink(
                    destination: HomeScreen().navigationBarHidden(true),
                    label: {
                        VStack() {
                            Image("Home")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .cornerRadius(5)

                            Text("Home")
                                .foregroundColor(.primary)
                                .font(.custom("DIN Alternate", size: 15))
                        }
                    }
                )
                Spacer().frame(width: 40)
                
                NavigationLink(
                    destination: MealsScreen().navigationBarHidden(true),
                    label: {
                        VStack() {
                            Image("Meals")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .cornerRadius(5)

                            Text("Meals")
                                .foregroundColor(.primary)
                                .font(.custom("DIN Alternate", size: 15))
                        }
                    }
                )
                
                Spacer().frame(width: 40)
                
                NavigationLink(
                    destination: ExerciseScreen().navigationBarHidden(true),
                    label: {
                        VStack() {
                            Image("Exercise")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .cornerRadius(5)
                    

                            Text("Exercise")
                                .foregroundColor(.primary)
                                .font(.custom("DIN Alternate", size: 15))
                        }
                    }
                )
                
                Spacer().frame(width: 40)
                
                NavigationLink(
                    destination: ProfileScreen().navigationBarHidden(true),
                    label: {
                        VStack() {
                            Image("AccountSelected")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .cornerRadius(5)

                            Text("Profile")
                                .foregroundColor(.primary)
                                .font(.custom("DIN Alternate", size: 15))
                        }
                    }
                )
                Spacer()
            }*/
        }.ignoresSafeArea(edges: .top)
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
