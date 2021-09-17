//
//  HomeScreenMealRow.swift
//  Live It (iOS)
//
//  Created by Rik Roy on 8/30/21.
//

import SwiftUI

struct HomeScreenMealRow: View {
    
    var bMeal: MealItem
    var lMeal: MealItem
    var dMeal: MealItem
    
    var body: some View {
        VStack(alignment: .leading) {

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    bMeal
                    
                    lMeal
                    
                    dMeal
                }
            }
            .frame(height: 185)
        }
    }
}

struct HomeScreenMealRow_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenMealRow(bMeal: MealItem(imgName: "AddMeal", title: "", link: "", MOD: "Breakfast", calories: 0, id: 0, isHomeScreen: true), lMeal: MealItem(imgName: "AddMeal", title: "", link: "", MOD: "Lunch", calories: 0, id: 0, isHomeScreen: true), dMeal: MealItem(imgName: "AddMeal", title: "", link: "", MOD: "Dinner", calories: 0, id: 0, isHomeScreen: true))
    
    }
}
