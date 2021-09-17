//
//  ProgressBar.swift
//  Live It
//
//  Created by Rik Roy on 8/18/21.
//

import SwiftUI

struct ProgressBar: View {
   var value: Float
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width , height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color(UIColor.systemTeal))
                
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                        .foregroundColor(Color(UIColor.systemBlue))
                        .animation(.linear)
            }.cornerRadius(45.0)
        }
    }
}

