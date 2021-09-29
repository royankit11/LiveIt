//
//  ProfileInfo.swift
//  Live It
//
//  Created by Rik Roy on 9/21/21.
//

import SwiftUI

struct ProfileInfoEdit: View {
    
    var name: String
    var username: String
    var age: Int
    var gender: String
    var height: Int
    var weight: Int
    var activity: String
    
    @State var nameEdit: String = ""
    @State var ageEdit: String = ""
    @State var genderEdit: String = ""
    @State var heightEdit: String = ""
    @State var weightEdit: String = ""
    @State var activityEdit: String = ""
    
    @State private var register = false
    
    @ObservedObject var model = LoginViewModel()
    
    var lightGray = Color(red:225/255, green:232/255, blue:241/255)
    var red = Color(red:255/255, green:135/255, blue:135/255)
    
    init(name: String, username: String, age: Int, gender: String, height: Int, weight: Int, activity: String) {
        genderEdit = gender
        activityEdit = activity
        self.name = name
        self.username = username
        self.age = age
        self.gender = gender
        self.height = height
        self.weight = weight
        self.activity = activity
        
        _nameEdit = State(initialValue: name)
        _ageEdit = State(initialValue: String(age))
        _heightEdit = State(initialValue: String(height))
        _weightEdit = State(initialValue: String(weight))
    }
    
    var body: some View {
        HStack {
            Spacer().frame(width: 40)
            
            ScrollView {
                VStack(alignment: .leading){
                    Group {
                        HStack {
                            Text("Name:").font(.custom("DIN Alternate", size: 20))
                            Spacer().frame(width: 20)
                            ZStack {
                                Capsule()
                                    .fill(lightGray)
                                    .frame(height:40)
                                    .frame(width: 200)
                                    .shadow(radius: 8)
                                
                                HStack {
                                    Spacer().frame(width:60)
                                    
                                    
                                    TextField(name, text: $nameEdit).padding().font(.custom("DIN Alternate", size: 25))
                                }
                            }
                        }
                        
                        Spacer().frame(height: 15)
                        
                        HStack {
                            Text("Age: ").font(.custom("DIN Alternate", size: 20))
                            ZStack {
                                Capsule()
                                    .fill(lightGray)
                                    .frame(height:40)
                                    .frame(width: 90)
                                    .shadow(radius: 8)
                                
                                HStack {
                                    Spacer().frame(width:70)
                                    
                                    
                                    TextField(String(age), text: $ageEdit).font(.custom("DIN Alternate", size: 25))
                                        .keyboardType(.decimalPad)
                                        .frame(width: 90)
                                }

                            }
                        }
                    }
                    
                    
                    Spacer().frame(height: 15)
                    
                    HStack {
                        Text("Gender: ").font(.custom("DIN Alternate", size: 20))
                        Spacer().frame(width: 20)
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
                                        genderEdit = "Male";
                                    } label: {
                                        Text("Male")
                                    }
                                    Button {
                                        genderEdit = "Female";
                                    } label: {
                                        Text("Female")
                                    }
                                } label: {
                                     Text(genderEdit).font(.custom("DIN Alternate", size: 25))
                                }
                            }

                        }
                    }
                    
                    Spacer().frame(height: 15)
                    
                    HStack {
                        Text("Height (in inches) : ").font(.custom("DIN Alternate", size: 20))
                        Spacer().frame(width: 20)
                        ZStack {
                            Capsule()
                                .fill(lightGray)
                                .frame(height:40)
                                .frame(width: 90)
                                .shadow(radius: 8)
                            
                            HStack {
                                Spacer().frame(width:40)
                                
                                
                                TextField(String(height), text: $heightEdit).font(.custom("DIN Alternate", size: 25))
                                    .keyboardType(.decimalPad)
                                    .frame(width: 90)
                            }

                        }
                    }
                    
                    Spacer().frame(height: 15)
                    
                    HStack {
                        Text("Weight (in pounds) : ").font(.custom("DIN Alternate", size: 20))
                        Spacer().frame(width: 20)
                        
                        ZStack {
                            Capsule()
                                .fill(lightGray)
                                .frame(height:40)
                                .frame(width: 90)
                                .shadow(radius: 8)
                            
                            HStack {
                                Spacer().frame(width:40)
                                
                                
                                TextField(String(weight), text: $weightEdit).font(.custom("DIN Alternate", size: 25))
                                    .keyboardType(.decimalPad)
                                    .frame(width: 90)
                            }

                        }
                    }
                    
                    Spacer().frame(height: 15)
                    
                    HStack {
                        Text("Activity: ").font(.custom("DIN Alternate", size: 20))
                        Spacer().frame(width: 20)
                        ZStack {
                            Capsule()
                                .fill(lightGray)
                                .frame(height:40)
                                .frame(width: 200)
                                .shadow(radius: 8)
                            
                            HStack {
                                Spacer().frame(width:10)
                                
                                
                                Menu {
                                    Button {
                                        activityEdit = "Sedentary";
                                    } label: {
                                        Text("Sedentary (little to no exercise)")
                                    }
                                    Button {
                                        activityEdit = "Lightly Active";
                                    } label: {
                                        Text("Lightly Active (light exercise 1-3 days/week)")
                                    }
                                    Button {
                                        activityEdit = "Moderately Active";
                                    } label: {
                                        Text("Moderately Active (moderate exercise 3-5 days/week)")
                                    }
                                    Button {
                                        activityEdit = "Very Active";
                                    } label: {
                                        Text("Very Active (hard exercise 6-7 days/week)")
                                    }
                                    Button {
                                        activityEdit = "Extra Active";
                                    } label: {
                                        Text("Extra Active (intense activity daily")
                                    }
                                } label: {
                                     Text(activityEdit).font(.custom("DIN Alternate", size: 25))
                                }
                            }

                        }
                        
                    }
                    Group {
                        Spacer().frame(height: 80)
                        
                        HStack {
                            NavigationLink(destination: OverallNavigation(selection: .profile).navigationBarHidden(true)
                                            .navigationBarBackButtonHidden(true), isActive: $register) { EmptyView() }

                            Button {
                                
                                ContentView.model.users[0].fName = nameEdit
                                
                                ContentView.model.users[0].age = Int(ageEdit)!
                                
                                ContentView.model.users[0].gender = genderEdit
                                
                                ContentView.model.users[0].height = Int(heightEdit)!
                                
                                ContentView.model.users[0].weight = Int(weightEdit)!
                                
                                ContentView.model.users[0].activity = activityEdit
                                
                                activityEdit = activityEdit.replacingOccurrences(of: " ", with: "%20")
                                
                                model.updateUser(username: username, name: nameEdit, age: Int(ageEdit)!, gender: genderEdit, height: Int(heightEdit)!, weight: Int(weightEdit)!, activity: activityEdit)
                                
                                register = true
                            } label: {
                                ZStack {
                                    Capsule()
                                        .fill(red)
                                        .frame(height:53)
                                        .frame(width: 150)
                                        .shadow(radius: 8)
                                    Text("Update").font(.custom("DIN Alternate", size: 35)).foregroundColor(Color.black)
                                    
                                }
                            }
                            
                            NavigationLink(
                                destination: OverallNavigation(selection: .profile).navigationBarHidden(true)
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
    }
}

struct ProfileInfoEdit_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInfoEdit(name: "Rik", username: "RikR", age: 16, gender: "Male", height: 68, weight: 115, activity: "Moderately active")
    }
}
