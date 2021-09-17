//
//  CircleImage.swift
//  Live It
//
//  Created by Rik Roy on 8/10/21.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image.renderingMode(.original)
            .resizable()
            .frame(height: 200)
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .overlay(Circle()
            .stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("Meals"))
    }
}
