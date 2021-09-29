//
//  ProfileInfo.swift
//  Live It
//
//  Created by Rik Roy on 9/21/21.
//

import SwiftUI

struct ProfileInfo: View {
    
    var fName: String
    var lName: String
    var username: String
    var age: Int
    var gender: String
    var height: Int
    var weight: Int
    var activity: String
    
    var body: some View {
        VStack(alignment: .leading){
            Group {
                HStack {
                    Text("First Name:").font(.custom("DIN Alternate", size: 20))
                    Spacer().frame(width: 20)
                    Text(fName).font(.custom("DIN Alternate", size: 20))
                    
                    Spacer().frame(width: 90)
                    
                    NavigationLink(destination: ProfileInfoEdit(fName: fName, lName: lName, username: username, age: age, gender: gender, height: height, weight: weight, activity: activity).navigationBarHidden(true)
                                    .navigationBarBackButtonHidden(true), label: {
                        Image(systemName: "pencil.circle")
                            .resizable()
                            .frame(width: 40, height: 40)
                            .offset(y: -20)
                            .foregroundColor(Color.black)
                    })
                    

                }
                
                Spacer().frame(height: 15)
                
                HStack {
                    Text("Last Name: ").font(.custom("DIN Alternate", size: 20))
                    Spacer().frame(width: 20)
                    Text(lName).font(.custom("DIN Alternate", size: 20))
                }
                
                Spacer().frame(height: 15)
                
                HStack {
                    Text("Username: ").font(.custom("DIN Alternate", size: 20))
                    Spacer().frame(width: 20)
                    Text(username).font(.custom("DIN Alternate", size: 20))
                }
                
                Spacer().frame(height: 15)
                
                HStack {
                    Text("Age: ").font(.custom("DIN Alternate", size: 20))
                    Spacer().frame(width: 20)
                    Text(String(age)).font(.custom("DIN Alternate", size: 20))
                }
            }
            
            
            Spacer().frame(height: 15)
            
            HStack {
                Text("Gender: ").font(.custom("DIN Alternate", size: 20))
                Spacer().frame(width: 20)
                Text(gender).font(.custom("DIN Alternate", size: 20))
            }
            
            Spacer().frame(height: 15)
            
            HStack {
                Text("Height (in inches) : ").font(.custom("DIN Alternate", size: 20))
                Spacer().frame(width: 20)
                Text(String(height)).font(.custom("DIN Alternate", size: 20))
            }
            
            Spacer().frame(height: 15)
            
            HStack {
                Text("Weight (in pounds) : ").font(.custom("DIN Alternate", size: 20))
                Spacer().frame(width: 20)
                
                Text(String(weight)).font(.custom("DIN Alternate", size: 20))
            }
            
            Spacer().frame(height: 15)
            
            HStack {
                Text("Activity: ").font(.custom("DIN Alternate", size: 20))
                Spacer().frame(width: 20)
                Text(activity).font(.custom("DIN Alternate", size: 20))
            }

        }
    }
}

struct ProfileInfo_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInfo(fName: "Rik", lName: "Roy", username: "RikR", age: 16, gender: "Male", height: 68, weight: 115, activity: "Moderately active")
    }
}
