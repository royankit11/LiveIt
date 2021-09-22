//
//  ProfileScreen.swift
//  Live It
//
//  Created by Rik Roy on 8/10/21.
//

import SwiftUI

struct ProfileScreen: View {
    
    @ObservedObject var model: LoginViewModel = LoginViewModel()
    
    init() {
        model.getUser(strUsername: "RikR", strPassword: "1234")
    }
    
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
                
                    DropdownView(thumbnail: Image("Settings"), title: Text("Profile Info"), view: "Settings", name: model.users[0].fName, username: model.users[0].username, age: model.users[0].age, gender: model.users[0].gender, height: model.users[0].height, weight: model.users[0].weight, activity: model.users[0].activity)
                    
                    Divider()
                }
                
                Spacer()
            }
        }.ignoresSafeArea(edges: .top)
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
