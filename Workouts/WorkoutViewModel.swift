//
//  WorkoutViewModel.swift
//  Live It
//
//  Created by Rik Roy on 9/21/21.
//

import Foundation
import Combine
import SwiftUI

class WorkoutViewModel: ObservableObject {
    
    init() {
        fetchWorkouts()
    }
    
    var workouts = [WorkoutModel]() {
        didSet {
            didChange.send(self)
        }
    }
    
    func fetchWorkouts() {
        WorkoutCall().getWorkouts() {
            self.workouts = $0
        }
    }
    let didChange = PassthroughSubject<WorkoutViewModel, Never>()
    
}
