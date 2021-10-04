//
//  MealsScreen.swift
//  Live It
//
//  Created by Rik Roy on 7/28/21.
//

import SwiftUI

struct MealsScreen: View {
    
    @State private var showingAlert = false
    @State var selectedDate: Date = Date()
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    @ObservedObject var bModel: MealItemViewModel
    @ObservedObject var lModel: MealItemViewModel
    @ObservedObject var dModel: MealItemViewModel
    
    init() {
        self.bModel = MealItemViewModel(mod: "Breakfast", cals: 800, cuisines: "American%20Italian%20Mexican%20Indian")
        self.lModel = MealItemViewModel(mod: "Lunch", cals: 800, cuisines: "American%20Italian%20Mexican%20Japanese")
        self.dModel = MealItemViewModel(mod: "Dinner", cals: 1200, cuisines: "American%20Italian%20Mexican%20Indian")
        
    }

    var body: some View {
        /*NavigationLink(destination: OverallNavigation(selection: .home), isActive: $isShowingDetailView) { EmptyView() }*/
        
        VStack {
            ScrollView {
                Spacer().frame(height: 80)
                
                Text("Meals").font(.custom("DIN Alternate", size: 45))
                
                Spacer().frame(height: 50)
                
                Text("Breakfast Suggestions").font(.custom("DIN Alternate", size: 20))
                
                VStack(alignment: .leading) {

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 0) {
                            ForEach(bModel.meals, id: \.self) { meal in
                                MealItem(imgName: meal.ImageName, title: meal.RecipeName, link: meal.Link, MOD: meal.MealOfDay, calories: meal.Calories, id: meal.id, isHomeScreen: false)
                            }
                        }
                    }
                    .frame(height: 185)
                }
                
                Text("Lunch Suggestions").font(.custom("DIN Alternate", size: 20))
               
                VStack(alignment: .leading) {

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 0) {
                            ForEach(lModel.meals, id: \.self) { meal in
                                MealItem(imgName: meal.ImageName, title: meal.RecipeName, link: meal.Link, MOD: meal.MealOfDay, calories: meal.Calories, id: meal.id, isHomeScreen: false)
                            }
                        }
                    }
                    .frame(height: 185)
                }
                
                Text("Dinner Suggestions").font(.custom("DIN Alternate", size: 20))
                
                VStack(alignment: .leading) {

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 0) {
                            ForEach(dModel.meals, id: \.self) { meal in
                                MealItem(imgName: meal.ImageName, title: meal.RecipeName, link: meal.Link, MOD: meal.MealOfDay, calories: meal.Calories, id: meal.id, isHomeScreen: false)
                            }
                        }
                    }
                    .frame(height: 185)
                }
 
                
                Spacer()
            }
        }.ignoresSafeArea(edges: .top)
        
        
        
    }
}

struct MealsScreen_Previews: PreviewProvider {
    static var previews: some View {
        MealsScreen()
    }
}

