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
    
    @ObservedObject var model: WorkoutViewModel
    
    init() {
        self.model = WorkoutViewModel()
    }
    
    var body: some View {
        VStack {
            ScrollView {
                Spacer().frame(height: 100)
                
                Text("Exercise").font(.custom("DIN Alternate", size: 45))
                
                Spacer().frame(height: 50)
                
                Text("Workouts").font(.custom("DIN Alternate", size: 20))
                
                VStack(alignment: .leading) {

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(alignment: .top, spacing: 0) {
                            ForEach(model.workouts, id: \.self) { workout in
                                WorkoutItem(imgName: workout.ImageName, title: workout.Title, link: workout.Link, time: workout.Time, calories: workout.Calories, isHomeScreen: false, id: workout.id)
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

struct ExerciseScreen_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseScreen()
    }
}
