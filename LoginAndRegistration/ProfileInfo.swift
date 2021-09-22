//
//  ProfileInfo.swift
//  Live It
//
//  Created by Rik Roy on 9/21/21.
//

import SwiftUI

struct ProfileInfo: View {
    var body: some View {
        VStack {
            Group {
                HStack {
                    Text("Name:").font(.custom("DIN Alternate", size: 20))
                    Spacer().frame(width: 20)
                    Text("Rik").font(.custom("DIN Alternate", size: 20))
                }
                
                Spacer().frame(height: 15)
                
                HStack {
                    Text("Username: ").font(.custom("DIN Alternate", size: 20))
                    Spacer().frame(width: 20)
                    Text("RikR").font(.custom("DIN Alternate", size: 20))
                }
                
                Spacer().frame(height: 15)
                
                HStack {
                    Text("Age: ").font(.custom("DIN Alternate", size: 20))
                    Spacer().frame(width: 20)
                    Text("16").font(.custom("DIN Alternate", size: 20))
                }
            }
            
            
            Spacer().frame(height: 15)
            
            HStack {
                Text("Gender: ").font(.custom("DIN Alternate", size: 20))
                Spacer().frame(width: 20)
                Text("Male").font(.custom("DIN Alternate", size: 20))
            }
            
            Spacer().frame(height: 15)
            
            HStack {
                Text("Height (in inches) : ").font(.custom("DIN Alternate", size: 20))
                Spacer().frame(width: 20)
                Text("68").font(.custom("DIN Alternate", size: 20))
            }
            
            Spacer().frame(height: 15)
            
            HStack {
                Text("Activity: ").font(.custom("DIN Alternate", size: 20))
                Spacer().frame(width: 20)
                Text("Moderately Active").font(.custom("DIN Alternate", size: 20))
            }

        }
    }
}

struct ProfileInfo_Previews: PreviewProvider {
    static var previews: some View {
        ProfileInfo()
    }
}
