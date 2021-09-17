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
        self.bModel = MealItemViewModel(mod: "Breakfast", cals: 800, cuisines: "American")
        self.lModel = MealItemViewModel(mod: "Lunch", cals: 800, cuisines: "Italian")
        self.dModel = MealItemViewModel(mod: "Dinner", cals: 800, cuisines: "Mexican")
        
    }

    var body: some View {
        
        VStack {
            ScrollView {
                Spacer().frame(height: 50)
                
                HStack {
                    Spacer()
                    
                    Text("Meals").font(.custom("DIN Alternate", size: 45))
                        .padding(.top, 30)
                    
                    Spacer().frame(width: 90)
                    
                    NavigationLink(
                        destination: MealPrefsScreen(),
                        label: {
                            Image(systemName: "gear")
                                .renderingMode(.original)
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                    )
                    
                    Spacer().frame(width: 20)
                }
                
                DatePicker("Calendar", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .frame(width: 350, height: 300)
                    .alert(isPresented: $showingAlert, content: {
                        Alert(title: Text("Important"), message: Text("hello"))
                })
                
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
            /*
            Divider()
            
            HStack {
                Spacer().frame(width: 20)
                
                NavigationLink(
                    destination: HomeScreen().navigationBarHidden(true),
                    label: {
                        VStack() {
                            Image("Home")
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
                            Image("MealsSelected")
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

struct MealsScreen_Previews: PreviewProvider {
    static var previews: some View {
        MealsScreen()
    }
}

