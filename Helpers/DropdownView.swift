//
//  DropdownView.swift
//  Live It
//
//  Created by Rik Roy on 8/10/21.
//

import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

struct DropdownView: View {
    @State private var showDetail = false
    
    var thumbnail: Image
    var title: Text
    var view: String
    var name: String
    var username: String
    var age: Int
    var gender: String
    var height: Int
    var weight: Int
    var activity: String
    
    var body: some View {
        VStack {
            HStack {
                Spacer().frame(width: 10)
                thumbnail
                    .renderingMode(.original)
                    .resizable()
                    .frame(width:50, height: 50)
                VStack(alignment: .leading) {
                    title
                        .font(.custom("DIN Alternate", size: 25))
                }

                Spacer()

                Button(action: {
                    withAnimation {
                        self.showDetail.toggle()
                    }
                }) {
                    Image(systemName: "chevron.right.circle")
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90 : 0))
                        .scaleEffect(showDetail ? 1.5 : 1)
                        .padding()
                }
            }

            if showDetail {
                ProfileInfo(name: name, username: username, age: age, gender: gender, height: height, weight: weight, activity: activity).transition(.moveAndFade)
            }
        }
    }
}

struct DropdownView_Previews: PreviewProvider {
    static var previews: some View {
        DropdownView(thumbnail: Image("Settings"), title: Text("Profile Info"), view: "Settings", name: "", username: "", age: 0, gender: "", height: 0, weight: 0, activity: "")
    }
}
