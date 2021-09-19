//
//  MealItemViewModel.swift
//  Live It (iOS)
//
//  Created by Rik Roy on 9/19/21.

import Foundation
import Combine
import SwiftUI

class MealItemViewModel: ObservableObject {
    
    init(mod: String, cals: Int, cuisines: String) {
        fetchEvents(strMod: mod, intCals: cals, strCuisines: cuisines)
    }
    
    var meals = [MealItemModel]() {
        didSet {
            didChange.send(self)
        }
    }
    
    func fetchEvents(strMod: String, intCals: Int, strCuisines: String) {
        MealItemCall().getMeals(mealOfDay: strMod, cals: intCals, cuisines: strCuisines) {
            self.meals = $0
        }
    }
    let didChange = PassthroughSubject<MealItemViewModel, Never>()
    
}
