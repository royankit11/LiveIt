//
//  WorkoutRow.swift
//  Live It
//
//  Created by Rik Roy on 7/27/21.
//

import SwiftUI

struct WorkoutRow: View {
    var items: [WorkoutItem]
    
    
    var body: some View {
        VStack(alignment: .leading) {

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items, id: \.self) { item in
                        item
                    }
                }
            }
        }
    }
}

struct WorkoutRow_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutRow(items: [WorkoutItem(imgName: "LegWorkout2", title: "PERFECT Leg Workout", link: "https://youtu.be/RjexvOAsVtI", time: 14, calories: 41, isHomeScreen: true), WorkoutItem(imgName: "LegWorkout2", title: "PERFECT Leg Workout", link: "https://youtu.be/RjexvOAsVtI", time: 14, calories: 41, isHomeScreen: true)])
    }
}
