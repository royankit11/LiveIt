//
//  ProfileInfo.swift
//  Live It
//
//  Created by Rik Roy on 9/21/21.
//

import SwiftUI

struct ProfileInfo: View {
    
    var name: String
    var username: String
    var age: Int
    var gender: String
    var height: Int
    var weight: Int
    var activity: String
    
    var body: some View {
        VStack {
            Group {
                HStack {
                    Text("Name:").font(.custom("DIN Alternate", size: 20))
                    Spacer().frame(width: 20)
                    Text(name).font(.custom("DIN Alternate", size: 20))
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
        ProfileInfo(name: "Rik", username: "RikR", age: 16, gender: "Male", height: 68, weight: 115, activity: "Moderately active")
    }
}
