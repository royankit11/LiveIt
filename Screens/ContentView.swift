//
//  ContentView.swift
//  Shared
//
//  Created by Rik Roy on 7/22/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var usernameAlert = false
    @State private var passAlert = false
    
    let group = DispatchGroup()
    
    var lightGray = Color(red:225/255, green:232/255, blue:241/255)
    
    var red = Color(red:255/255, green:135/255, blue:135/255)
    
    @ObservedObject var model = LoginViewModel()
    
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer().frame(height:10)
                
                Text("Sign In").font(.custom("DIN Alternate", size: 70))
                
                Spacer()
                    .frame(height: 90)
                
                ZStack {
                    Capsule()
                        .fill(lightGray)
                        .frame(height:40)
                        .frame(width: 350)
                        .shadow(radius: 8)
                    
                    HStack {
                        Spacer().frame(width:60)
                        
                        Image("Person")
                        
                        TextField("Enter Username", text: $username).padding().font(.custom("DIN Alternate", size: 25))
                    }
            

                }
                
                Spacer().frame(height:30)
                
                ZStack {
                    Capsule()
                        .fill(lightGray)
                        .frame(height: 40)
                        .frame(width: 350)
                        .shadow(radius: 8)
                    
                    HStack {
                        Spacer().frame(width:60)
                        
                        Image("Lock")
                        
                        TextField("Enter Password", text: $password).padding().font(.custom("DIN Alternate", size: 25))
                    }
            

                }
                Spacer().frame(height:80)
                    
                NavigationLink(
                    destination: OverallNavigation(selection: .home)
                        .navigationBarHidden(true)
                        .navigationBarBackButtonHidden(true),
                    label: {
                        ZStack {
                            Capsule()
                                .fill(red)
                                .frame(height:53)
                                .frame(width: 255)
                                .shadow(radius: 8)
                            Text("Login")
                        }
                        
                    })
                    .font(.custom("DIN Alternate", size: 35)).foregroundColor(Color.black)
                
                /*Button {
                    if(username != "" && password != "") {
                        
                        model.getUser(strUsername: username, strPassword: password)
                        
                        print(model.users)
                        
                    } else {
                        usernameAlert = true
                        return
                    }
                    

                } label: {
                    ZStack {
                        Capsule()
                            .fill(red)
                            .frame(height:53)
                            .frame(width: 255)
                            .shadow(radius: 8)
                        Text("Login").font(.custom("DIN Alternate", size: 35)).foregroundColor(Color.black)
                        
                    }
                }.alert(isPresented: $usernameAlert, content: {
                    Alert(title: Text("Enter username and password"), dismissButton: .default(Text("Got it!")))
                })*/

                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
