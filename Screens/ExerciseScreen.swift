//
//  ExerciseScreen.swift
//  Live It
//
//  Created by Rik Roy on 7/29/21.
//

import SwiftUI

struct ExerciseScreen: View {
    @State var selectedDate: Date = Date()
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    
    var body: some View {
        VStack {
            ScrollView {
                Spacer().frame(height: 50)
                
                Text("Exercise").font(.custom("DIN Alternate", size: 45))
                
                DatePicker("Calendar", selection: $selectedDate, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .frame(width: 350, height: 300)
                
                Text("\(selectedDate, formatter: dateFormatter) Workout").font(.custom("DIN Alternate", size: 20))
                
                WorkoutRow(items: [WorkoutItem(imgName: "LegWorkout2", title: "PERFECT Leg Workout", link: "https://youtu.be/RjexvOAsVtI", time: 14, calories: 41, isHomeScreen: false), WorkoutItem(imgName: "LegWorkout2", title: "PERFECT Leg Workout", link: "https://youtu.be/RjexvOAsVtI", time: 14, calories: 41, isHomeScreen: false)])
                
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
                            Image("ExerciseSelected")
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

struct ExerciseScreen_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseScreen()
    }
}
