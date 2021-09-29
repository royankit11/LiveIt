//
//  MealItem.swift
//  Live It
//
//  Created by Rik Roy on 7/27/21.
//

import SwiftUI

struct MealItem: View, Hashable {
    let imgName: String
    let title: String
    let link: String
    let MOD: String
    let calories: Int
    let id: Int
    let isHomeScreen: Bool
    var isSelected: Bool = false
    
    
    var body: some View {
        
        if(imgName == "AddMeal") {
            VStack(alignment: .leading) {
                Image(imgName)
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 199, height: 136)
                    .cornerRadius(5)
                Text("Add " + MOD)
                    .foregroundColor(.primary)
                    .font(.caption)
            }
            .padding(.leading, 15)
        } else if(isHomeScreen) {
            Link(destination: URL(string: link)!) {
                VStack(alignment: .leading) {
                    Image(imgName)
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 199, height: 136)
                        .cornerRadius(5)
                    Text(MOD + " • " + title)
                        .foregroundColor(.primary)
                        .font(.caption)
                    Text(String(calories) + " cal")
                        .foregroundColor(.primary)
                        .font(.caption)
                }
                .padding(.leading, 15)
            }
        } else {
            if(id == HomeScreen.model.ids[0].B_ID || id == HomeScreen.model.ids[0].L_ID || id == HomeScreen.model.ids[0].D_ID) {
                NavigationLink(
                    destination: MealDetailScreen(imgName: imgName, title: title, link: link, mod: MOD, calories: calories, id: id, selected: true),
                    label: {
                        VStack(alignment: .leading) {
                            Image(imgName)
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 199, height: 136)
                                .cornerRadius(5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.red, lineWidth: 4)
                                )
                            Text(MOD + " • " + title)
                                .foregroundColor(.primary)
                                .font(.caption)
                            Text(String(calories) + " cal")
                                .foregroundColor(.primary)
                                .font(.caption)
                        }
                        .padding(.leading, 15)
                    }
                )
            } else {
                NavigationLink(
                    destination: MealDetailScreen(imgName: imgName, title: title, link: link, mod: MOD, calories: calories, id: id, selected: false),
                    label: {
                        VStack(alignment: .leading) {
                            Image(imgName)
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 199, height: 136)
                                .cornerRadius(5)
                            Text(MOD + " • " + title)
                                .foregroundColor(.primary)
                                .font(.caption)
                            Text(String(calories) + " cal")
                                .foregroundColor(.primary)
                                .font(.caption)
                        }
                        .padding(.leading, 15)
                    }
                )
            }
        }
    }
}

struct MealItem_Previews: PreviewProvider {
    static var previews: some View {
        MealItem(imgName: "ChickenKatsu", title: "Chicken Katsu", link: "https://www.foodnetwork.com/recipes/food-network-kitchen/chicken-katsu-with-ginger-rice-3364533#/", MOD: "Dinner", calories: 300, id: 1, isHomeScreen: true)
    }
}
