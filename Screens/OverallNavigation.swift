//
//  OverallNavigation.swift
//  Live It
//
//  Created by Rik Roy on 9/1/21.
//

import SwiftUI

struct OverallNavigation: View {
    @State var selection: Tab

    
    enum Tab {
        case home
        case meals
        case exercise
        case profile
    }
    
    var body: some View {
        NavigationView {
            TabView(selection: $selection) {
                HomeScreen()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .tag(Tab.home)

                MealsScreen()
                    .tabItem {
                        Label("Meals", systemImage: "cart")
                    }
                    .tag(Tab.meals)
                ExerciseScreen()
                    .tabItem {
                        Label("Exercise", systemImage: "figure.walk")
                    }
                    .tag(Tab.exercise)
                
                ProfileScreen()
                    .tabItem {
                        Label("Profile", systemImage: "person")
                    }
                    .tag(Tab.profile)
            }
        }.navigationBarTitle("")
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationBarHidden(true)
            .padding(.top, 1)
            .navigationBarBackButtonHidden(true)
    }
}

struct OverallNavigation_Previews: PreviewProvider {
    static var previews: some View {
        OverallNavigation(selection: .home)
    }
}

