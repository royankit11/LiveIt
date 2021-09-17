//
//  WorkoutItem.swift
//  Live It
//
//  Created by Rik Roy on 7/27/21.
//

import SwiftUI

struct WorkoutItem: View, Hashable {
    
    let imgName: String
    let title: String
    let link: String
    let time: Int
    let calories: Int
    let isHomeScreen: Bool
    
    var body: some View {
        if(imgName == "AddMeal") {
            NavigationLink(
                destination: ExerciseScreen().navigationBarHidden(true),
                label: {
                    VStack(alignment: .leading) {
                        Image(imgName)
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 199, height: 170)
                            .cornerRadius(5)
                        Text("Add Workout")
                            .foregroundColor(.primary)
                            .font(.caption)
                    }
                    .padding(.leading, 15)
                }
            )
        } else if(isHomeScreen) {
            Link(destination: URL(string: link)!) {
                VStack(alignment: .leading) {
                    Image(imgName)
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 199, height: 170)
                        .cornerRadius(5)
                    Text(title)
                        .foregroundColor(.primary)
                        .font(.caption)
                    Text(String(time) + " min • " + String(calories) + " cal")
                        .foregroundColor(.primary)
                        .font(.caption)
                }
                .padding(.leading, 15)
            }
        } else {
            NavigationLink(
                destination: MealDetailScreen(imgName: imgName, title: title, link: link, mod: "Lunch", calories: 0, id: -1),
                label: {
                    VStack(alignment: .leading) {
                        Image(imgName)
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 199, height: 170)
                            .cornerRadius(5)
                        Text(title)
                            .foregroundColor(.primary)
                            .font(.caption)
                        Text(String(time) + " min • " + String(calories) + " cal")
                            .foregroundColor(.primary)
                            .font(.caption)
                    }
                    .padding(.leading, 15)
                }
            )
        }

    }
}

struct WorkoutItem_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutItem(imgName: "LegWorkout2", title: "PERFECT Leg Workout", link: "https://youtu.be/RjexvOAsVtI", time: 14, calories: 41, isHomeScreen: true)
    }
}
