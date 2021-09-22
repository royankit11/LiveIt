//
//  RegisterScreen.swift
//  Live It (iOS)
//
//  Created by Rik Roy on 9/22/21.
//

import SwiftUI

struct RegisterScreen: View {
    
    @State private var firstName: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var age: String = ""
    @State private var gender: String = "Gender"
    @State private var height: String = ""
    @State private var weight: String = ""
    @State private var activity: String = "Activity"
    
    @State private var register = false
    
    var lightGray = Color(red:225/255, green:232/255, blue:241/255)
    var red = Color(red:255/255, green:135/255, blue:135/255)
    
    @ObservedObject var model = LoginViewModel()
    
    var body: some View {
        VStack {
            Group {
                
                Text("Registration").font(.custom("DIN Alternate", size: 40))
                
                HStack {
                    ZStack {
                        Capsule()
                            .fill(lightGray)
                            .frame(height:40)
                            .frame(width: 300)
                            .shadow(radius: 8)
                        
                        HStack {
                            Spacer().frame(width:80)
                            
                            
                            
                            TextField("First Name", text: $firstName).padding().font(.custom("DIN Alternate", size: 25))
                        }
                

                    }
                }
                
                Spacer().frame(height: 15)
                
                HStack {
                    ZStack {
                        Capsule()
                            .fill(lightGray)
                            .frame(height:40)
                            .frame(width: 300)
                            .shadow(radius: 8)
                        
                        HStack {
                            Spacer().frame(width:80)
                            
                            
                            
                            TextField("Username", text: $username).padding().font(.custom("DIN Alternate", size: 25))
                        }
                

                    }
                }
                
                Spacer().frame(height: 15)
                
                HStack {
                    ZStack {
                        Capsule()
                            .fill(lightGray)
                            .frame(height:40)
                            .frame(width: 300)
                            .shadow(radius: 8)
                        
                        HStack {
                            Spacer().frame(width:80)
                            
                            
                            
                            SecureField("Password", text: $password).padding().font(.custom("DIN Alternate", size: 25))
                        }
                

                    }
                }
            }
            
            
            Spacer().frame(height: 15)
            
            Group {
                HStack {
                    ZStack {
                        Capsule()
                            .fill(lightGray)
                            .frame(height:40)
                            .frame(width: 90)
                            .shadow(radius: 8)
                        
                        HStack {
                            Spacer().frame(width:60)
                            
                            
                            TextField("Age", text: $age).padding().font(.custom("DIN Alternate", size: 25))
                                .keyboardType(.decimalPad)
                        }
                        
                    }
                    
                    ZStack {
                        Capsule()
                            .fill(lightGray)
                            .frame(height:40)
                            .frame(width: 120)
                            .shadow(radius: 8)
                        
                        HStack {
                            Spacer().frame(width:10)
                            
                            
                            
                            Menu {
                                Button {
                                    gender = "Male";
                                } label: {
                                    Text("Male")
                                }
                                Button {
                                    gender = "Female";
                                } label: {
                                    Text("Female")
                                }
                            } label: {
                                 Text(gender).font(.custom("DIN Alternate", size: 25))
                            }
                        }
                    }
                    
                    Spacer().frame(width:50)
                }
                
                Spacer().frame(height: 15)
                
                HStack {
                    
                    Spacer().frame(width:10)
                    
                    ZStack {
                        Capsule()
                            .fill(lightGray)
                            .frame(height:40)
                            .frame(width: 150)
                            .shadow(radius: 8)
                        
                        HStack {
                            Spacer().frame(width:10)
                            
                            
                            TextField("Height", text: $height).padding().font(.custom("DIN Alternate", size: 25))
                                .keyboardType(.decimalPad)
                            
                            Text("in").font(.custom("DIN Alternate", size: 25)).offset(x: -20)
                        }
                        
                    }
                    
                    Spacer().frame(width:10)
                    
                    ZStack {
                        Capsule()
                            .fill(lightGray)
                            .frame(height:40)
                            .frame(width: 160)
                            .shadow(radius: 8)
                        
                        HStack {
                            Spacer().frame(width:10)
                            
                            
                            
                            TextField("Weight", text: $weight).font(.custom("DIN Alternate", size: 25))
                                .keyboardType(.decimalPad)
                            
                            Text("lbs").font(.custom("DIN Alternate", size: 25)).offset(x: -20)
                        }
                    }
                    
                }
                
                
                Spacer().frame(height: 15)
                
                HStack {
                    ZStack {
                        Capsule()
                            .fill(lightGray)
                            .frame(height:40)
                            .frame(width: 300)
                            .shadow(radius: 8)
                        
                        HStack {
                            Spacer().frame(width:10)
                            
                            
                            
                            Menu {
                                Button {
                                    activity = "Sedentary";
                                } label: {
                                    Text("Sedentary (little to no exercise)")
                                }
                                Button {
                                    activity = "Lightly Active";
                                } label: {
                                    Text("Lightly Active (light exercise 1-3 days/week)")
                                }
                                Button {
                                    activity = "Moderately Active";
                                } label: {
                                    Text("Moderately Active (moderate exercise 3-5 days/week)")
                                }
                                Button {
                                    activity = "Very Active";
                                } label: {
                                    Text("Very Active (hard exercise 6-7 days/week)")
                                }
                                Button {
                                    activity = "Extra Active";
                                } label: {
                                    Text("Extra Active (intense activity daily")
                                }
                            } label: {
                                 Text(activity).font(.custom("DIN Alternate", size: 25))
                            }
                        }
                

                    }
                }
                Spacer().frame(height: 50)
                
                HStack {
                    VStack {
                        NavigationLink(destination: ContentView().navigationBarHidden(true)
                                        .navigationBarBackButtonHidden(true), isActive: $register) { EmptyView() }

                        Button {
                            activity = activity.replacingOccurrences(of: " ", with: "%20")
                            
                            model.registerUser(firstName: firstName, username: username, password: password, age: Int(age)!, gender: gender, height: Int(height)!, weight: Int(weight)!, activity: activity)
                            register = true
                        } label: {
                            ZStack {
                                Capsule()
                                    .fill(red)
                                    .frame(height:53)
                                    .frame(width: 150)
                                    .shadow(radius: 8)
                                    .padding(20)
                                Text("Register").font(.custom("DIN Alternate", size: 35)).foregroundColor(Color.black)
                                
                            }
                        }
                    }
                    
                    
                    NavigationLink(
                        destination: ContentView()
                            .navigationBarHidden(true)
                            .navigationBarBackButtonHidden(true),
                        label: {
                            ZStack {
                                Capsule()
                                    .fill(red)
                                    .frame(height:53)
                                    .frame(width: 150)
                                    .shadow(radius: 8)
                                Text("Cancel")
                            }
                            
                        })
                        .font(.custom("DIN Alternate", size: 35)).foregroundColor(Color.black)
                    
                }
                
            }

        }
    }
}

struct RegisterScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegisterScreen()
    }
}
