//
//  HomeScreen.swift
//  Live It
//
//  Created by Rik Roy on 7/26/21.
//

import SwiftUI

struct HomeScreen: View {
    
    var totalCalories: Int = 2655
    var red = Color(red:255/255, green:135/255, blue:135/255)

    @ObservedObject var model: HomeScreenViewModel = HomeScreenViewModel()

    
    @State private var isShowingDetailView = false
    
    var dailyCalories: Int = 0

    var bMeal: MealItem = MealItem(imgName: "AddMeal", title: "", link: "", MOD: "Breakfast", calories: 0, id: 0, isHomeScreen: true)
    
    var lMeal: MealItem = MealItem(imgName: "AddMeal", title: "", link: "", MOD: "Lunch", calories: 0, id: 0, isHomeScreen: true)
    
    var dMeal: MealItem = MealItem(imgName: "AddMeal", title: "", link: "", MOD: "Dinner", calories: 0, id: 0, isHomeScreen: true)
    
    let date = Date()

    
    init() {
        print("isShowing" + String(isShowingDetailView))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        let yearString = dateFormatter.string(from: date)
        dateFormatter.dateFormat = "M"
        let monthString = dateFormatter.string(from: date)
        dateFormatter.dateFormat = "d"
        let dayString = dateFormatter.string(from: date)
        
        
    
        model.fetchIDs(month: monthString, day: dayString, year: yearString)

        

        
        let b_id = model.ids[0].B_ID
        let l_id = model.ids[0].L_ID
        let d_id = model.ids[0].D_ID

    
        
        if(b_id != 0) {
            model.chooseMeals(mealID: b_id)
            let meal = model.mealsFromID[0]
            bMeal = MealItem(imgName: meal.ImageName, title: meal.RecipeName, link: meal.Link, MOD: meal.MealOfDay, calories: meal.Calories, id: meal.id, isHomeScreen: true)
        }
        
        if(l_id != 0) {
            model.chooseMeals(mealID: l_id)
            let meal = model.mealsFromID[0]
            lMeal = MealItem(imgName: meal.ImageName, title: meal.RecipeName, link: meal.Link, MOD: meal.MealOfDay, calories: meal.Calories, id: meal.id, isHomeScreen: true)
        }
        
        if(d_id != 0) {
            model.chooseMeals(mealID: d_id)
            let meal = model.mealsFromID[0]
            dMeal = MealItem(imgName: meal.ImageName, title: meal.RecipeName, link: meal.Link, MOD: meal.MealOfDay, calories: meal.Calories, id: meal.id, isHomeScreen: true)
        }

        dailyCalories = bMeal.calories + lMeal.calories + dMeal.calories
    }
    
    var body: some View {
        
        VStack {
            Spacer().frame(height: 100)
            
            ScrollView {
                
                HStack {
                    Spacer()
                    
                    Text("Welcome Rik").font(.custom("DIN Alternate", size: 45))

                    
                    Spacer().frame(width: 50)
                    
                    Button {
                        isShowingDetailView.toggle()
                    } label: {
                        Image(systemName: "arrow.clockwise.circle")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    
                    Spacer().frame(width: 20)
                
                }
                

                
                Spacer().frame(height: 20)
            
                Group {
                    HStack {
                        Text("Today's Calories")
                            .font(.custom("DIN Alternate", size: 25))
                            .padding(.leading, 15)
                            .padding(.top, 5)
                        
                        Spacer()
                    }
                    
                    
                    ProgressBar(value: Float(dailyCalories)/Float(totalCalories))
                        .frame(height: 20)
                        .padding(.leading, 10)
                        .padding(.trailing, 10)
                    
                    HStack {
                        Spacer()
                        
                        Text(String(dailyCalories) + "/" + String(totalCalories)).font(.custom("DIN Alternate", size: 20))
                        
                        Spacer().frame(width:30)
                    }
                    
                    
                    Spacer().frame(height: 20)
                    
                    HStack {
                        Text("Today's Meal")
                            .font(.custom("DIN Alternate", size: 25))
                            .padding(.leading, 15)
                            .padding(.top, 5)
                        
                        Spacer()
                    }
                    
                    HomeScreenMealRow(bMeal: bMeal, lMeal: lMeal, dMeal: dMeal)
                    
                    
                    Spacer().frame(height: 20)
                    
                    HStack {
                        Text("Today's Workout")
                            .font(.custom("DIN Alternate", size: 25))
                            .padding(.leading, 15)
                            .padding(.top, 5)
                        
                        Spacer()
                    }
                    
                    WorkoutRow(items: [WorkoutItem(imgName: "AddMeal", title: "", link: "", time: 0, calories: 0, isHomeScreen: true)])
                    
                    Spacer()
                }
                
                NavigationLink(destination: OverallNavigation(selection: .home).navigationBarHidden(true).navigationBarBackButtonHidden(true), isActive: $isShowingDetailView) { EmptyView() }
                
            }
            /*
            Divider()
            
            HStack {
                Spacer().frame(width: 20)
                
                NavigationLink(
                    destination: HomeScreen().navigationBarHidden(true),
                    label: {
                        VStack() {
                            Image("HomeSelected")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .cornerRadius(5)

                            Text("Home")
                                .foregroundColor(.primary)
                                .font(.custom("DIN Alternate", size: 15))
                        }
                    }
                )
                Spacer().frame(width: 40)
                
                NavigationLink(
                    destination: MealsScreen().navigationBarHidden(true),
                    label: {
                        VStack() {
                            Image("Meals")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .cornerRadius(5)

                            Text("Meals")
                                .foregroundColor(.primary)
                                .font(.custom("DIN Alternate", size: 15))
                        }
                    }
                )
                
                Spacer().frame(width: 40)
                
                NavigationLink(
                    destination: ExerciseScreen().navigationBarHidden(true),
                    label: {
                        VStack() {
                            Image("Exercise")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .cornerRadius(5)
                    

                            Text("Exercise")
                                .foregroundColor(.primary)
                                .font(.custom("DIN Alternate", size: 15))
                        }
                    }
                )
                
                Spacer().frame(width: 40)
                
                NavigationLink(
                    destination: ProfileScreen().navigationBarHidden(true),
                    label: {
                        VStack() {
                            Image("Account")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .cornerRadius(5)

                            Text("Profile")
                                .foregroundColor(.primary)
                                .font(.custom("DIN Alternate", size: 15))
                        }
                    }
                )
                Spacer()
            }*/
            
        }.ignoresSafeArea(edges: .top)
        
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
