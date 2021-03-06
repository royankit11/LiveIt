//
//  WorkoutDetailScreen.swift
//  Live It
//
//  Created by Rik Roy on 9/21/21.
//

import SwiftUI

struct WorkoutDetailScreen: View {
    
    var imgName: String
    var title: String
    var link: String
    var calories: Int
    var id: Int
    var time: String
    var red = Color(red:255/255, green:135/255, blue:135/255)
    var gray = Color(red:186/255, green:186/255, blue:186/255)
    @State private var selected: Bool
    
    init(imgName: String, title: String, link: String, time: String, calories: Int, id: Int, selected: Bool) {
        self.imgName = imgName
        self.title = title
        self.link = link
        self.time = time
        self.calories = calories
        self.id = id
        
        self.selected = selected
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
            
            Button {
                selected.toggle()
                
                var workoutID: Int
                if(selected == true) {
                    workoutID = id
                } else {
                    workoutID = 0
                }
                
                let date = Date()
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy"
                let yearString = dateFormatter.string(from: date)
                dateFormatter.dateFormat = "M"
                let monthString = dateFormatter.string(from: date)
                dateFormatter.dateFormat = "d"
                let dayString = dateFormatter.string(from: date)
                    
                print(workoutID)
                model.fetchWorkouts(month: monthString, day: dayString, year: yearString, workoutID: workoutID)
                
                
                

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
                    Text("View Video").font(.custom("DIN Alternate", size: 35)).foregroundColor(Color.black)
                }
            }
            
            Spacer()
            
        }
    }
}

struct WorkoutDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDetailScreen(imgName: "LegWorkout", title: "PERFECT Leg Workout", link: "https://www.foodnetwork.com/recipes/food-network-kitchen/chicken-katsu-with-ginger-rice-3364533#/", time: "14:32", calories: 42, id: 10, selected: false)
    }
}
