//
//  MealDetailScreen.swift
//  Live It
//
//  Created by Rik Roy on 8/18/21.
//

import SwiftUI

struct MealDetailScreen: View {
    var imgName: String
    var title: String
    var link: String
    var mod: String
    var calories: Int
    var id: Int
    var red = Color(red:255/255, green:135/255, blue:135/255)
    var gray = Color(red:186/255, green:186/255, blue:186/255)
    @State private var selected: Bool
    
    init(imgName: String, title: String, link: String, mod: String, calories: Int, id: Int) {
        self.imgName = imgName
        self.title = title
        self.link = link
        self.mod = mod
        self.calories = calories
        self.id = id
        
        selected = false
    }
    
    
    @ObservedObject var model: HomeScreenViewModel = HomeScreenViewModel()
    
        
    var body: some View {
        VStack {
            Text(title).font(.custom("DIN Alternate", size: 45))
            
            Image(imgName)
                .renderingMode(.original)
                .resizable()
                .frame(width: 400, height: 300)
            
            Spacer().frame(height: 50)
            
            /*NavigationLink(
                destination: HomeScreen().navigationBarHidden(true),
                label: {
                    ZStack {
                        Capsule()
                            .fill(red)
                            .frame(height:53)
                            .frame(width: 255)
                            .shadow(radius: 8)
                        Text("Select").font(.custom("DIN Alternate", size: 35)).foregroundColor(Color.black)
                    }
                }
            )*/
            
            Button {
                selected.toggle()
                
                var mealID: Int
                if(selected == true) {
                    mealID = id
                } else {
                    mealID = 0
                }
                
                let date = Date()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy"
                let yearString = dateFormatter.string(from: date)
                dateFormatter.dateFormat = "M"
                let monthString = dateFormatter.string(from: date)
                dateFormatter.dateFormat = "d"
                let dayString = dateFormatter.string(from: date)

                model.fetchMeals(month: monthString, day: dayString, year: yearString, mealID: mealID, mealOfDay: mod)
                
                
                

            } label: {
                if(selected == false) {
                    ZStack {
                        Capsule()
                            .fill(red)
                            .frame(height:53)
                            .frame(width: 255)
                            .shadow(radius: 8)
                        Text("Select").font(.custom("DIN Alternate", size: 35)).foregroundColor(Color.black)
                    }
                } else {
                    ZStack {
                        Capsule()
                            .fill()
                            .frame(height:53)
                            .frame(width: 255)
                            .shadow(radius: 8)
                        Text("Select").font(.custom("DIN Alternate", size: 35)).foregroundColor(Color.black)
                    }
                }
                
            }
            
            Spacer().frame(height: 20)
            
            Link(destination: URL(string: link)!) {
                ZStack {
                    Capsule()
                        .fill(red)
                        .frame(height:53)
                        .frame(width: 255)
                        .shadow(radius: 8)
                    Text("View Recipe").font(.custom("DIN Alternate", size: 35)).foregroundColor(Color.black)
                }
            }
            
            Spacer()
            
        }
    }
}

struct MealDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailScreen(imgName: "ChickenKatsu", title: "Chicken Katsu", link: "https://www.foodnetwork.com/recipes/food-network-kitchen/chicken-katsu-with-ginger-rice-3364533#/", mod: "Dinner", calories: 610, id: 10)
    }
}
