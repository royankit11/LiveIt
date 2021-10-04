//
//  HomeScreen.swift
//  Live It
//
//  Created by Rik Roy on 7/26/21.
//

import SwiftUI

struct HomeScreen: View {
    
    var totalCalories: Double = 0
    var red = Color(red:255/255, green:135/255, blue:135/255)

    @ObservedObject static var model: HomeScreenViewModel = HomeScreenViewModel()

    
    @State private var isShowingDetailView = false
    
    var dailyCalories: Int = 0

    var bMeal: MealItem = MealItem(imgName: "AddMeal", title: "", link: "", MOD: "Breakfast", calories: 0, id: -1, isHomeScreen: true)
    
    var lMeal: MealItem = MealItem(imgName: "AddMeal", title: "", link: "", MOD: "Lunch", calories: 0, id: -1, isHomeScreen: true)
    
    var dMeal: MealItem = MealItem(imgName: "AddMeal", title: "", link: "", MOD: "Dinner", calories: 0, id: -1, isHomeScreen: true)
    
    var workoutItem: WorkoutItem = WorkoutItem(imgName: "AddMeal", title: "", link: "", time: "", calories: 0, isHomeScreen: true, id: -1)
    
    let date = Date()

    
    init() {
        @ObservedObject var model2 = LoginViewModel()
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        let yearString = dateFormatter.string(from: date)
        dateFormatter.dateFormat = "M"
        let monthString = dateFormatter.string(from: date)
        dateFormatter.dateFormat = "d"
        let dayString = dateFormatter.string(from: date)
        
        
    
        HomeScreen.model.fetchIDs(month: monthString, day: dayString, year: yearString)

        
        

        
        let b_id = HomeScreen.model.ids[0].B_ID
        let l_id = HomeScreen.model.ids[0].L_ID
        let d_id = HomeScreen.model.ids[0].D_ID
        let w_id = HomeScreen.model.ids[0].W_ID

    
        
        if(b_id != 0) {
            HomeScreen.model.chooseMeals(mealID: b_id)
            let meal = HomeScreen.model.mealsFromID[0]
            bMeal = MealItem(imgName: meal.ImageName, title: meal.RecipeName, link: meal.Link, MOD: meal.MealOfDay, calories: meal.Calories, id: meal.id, isHomeScreen: true)
        }
        
        if(l_id != 0) {
            HomeScreen.model.chooseMeals(mealID: l_id)
            let meal = HomeScreen.model.mealsFromID[0]
            lMeal = MealItem(imgName: meal.ImageName, title: meal.RecipeName, link: meal.Link, MOD: meal.MealOfDay, calories: meal.Calories, id: meal.id, isHomeScreen: true)
        }
        
        if(d_id != 0) {
            HomeScreen.model.chooseMeals(mealID: d_id)
            let meal = HomeScreen.model.mealsFromID[0]
            dMeal = MealItem(imgName: meal.ImageName, title: meal.RecipeName, link: meal.Link, MOD: meal.MealOfDay, calories: meal.Calories, id: meal.id, isHomeScreen: true)
        }
        
        if(w_id != 0) {
            HomeScreen.model.chooseWorkouts(workoutID: w_id)
            let workout = HomeScreen.model.workoutsFromID[0]
            workoutItem = WorkoutItem(imgName: workout.ImageName, title: workout.Title, link: workout.Link, time: workout.Time, calories: workout.Calories, isHomeScreen: true, id: workout.id)
        }

        dailyCalories = bMeal.calories + lMeal.calories + dMeal.calories
        
        var tCals: Double = 0
        let gender = ContentView.model.users[0].gender
        let height = ContentView.model.users[0].height
        let weight = ContentView.model.users[0].weight
        let age = ContentView.model.users[0].age
        let activity = ContentView.model.users[0].activity
        


        if(gender == "Male") {
            tCals = 66 + (6.3 * Double((weight)))
            tCals = tCals + (12.9 * Double(height))
            
            tCals =  tCals - (6.8 * Double(age))


        } else {
            tCals = 655 + (4.3 * Double((weight)))
            tCals = tCals + (4.7 * Double(height))
            
            tCals =  tCals - (4.7 * Double(age))

        }
        
        if(activity == "Sedentary") {
            tCals = tCals * 1.2
        } else if(activity == "Lightly Active") {
            tCals = tCals * 1.375
        } else if(activity == "Moderately Active") {
            tCals = tCals * 1.55
        } else if(activity == "Very Active") {
            tCals = tCals * 1.725
        } else {
            tCals = tCals * 1.9
        }
            
        tCals = round(tCals)

        
        totalCalories = tCals
        

    }
        

    
    var body: some View {
        VStack {
            Spacer().frame(height: 100)
            
            ScrollView {
                
                HStack {
                    Spacer()
                    
                    Text("Welcome " + ContentView.model.users[0].fName).font(.custom("DIN Alternate", size: 45))

                    
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
                    
                    HStack {
                        workoutItem
                        
                        Spacer()
                    }
                    

                    
                    
                    Spacer()
                }
                
                
                
                NavigationLink(destination: OverallNavigation(selection: .home), isActive: $isShowingDetailView) { EmptyView() }
                
            }
            
        }.ignoresSafeArea(edges: .top)
    
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

