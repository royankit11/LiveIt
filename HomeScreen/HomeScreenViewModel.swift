//
//  HomeScreenViewModel.swift
//  Live It (iOS)
//
//  Created by Rik Roy on 8/31/21.
//

import Foundation
import Combine
import SwiftUI

class HomeScreenViewModel: ObservableObject {
    
    let group = DispatchGroup()
    
    var meals = [HomeScreenModel]() {
        didSet {
            didChange.send(self)
        }
    }
    
    var ids = [HomeScreenIDModel]() {
        didSet {
            didChange.send(self)
        }
    }
    
    var mealsFromID = [MealItemModel]() {
        didSet {
            didChange.send(self)
        }
    }
    
    func fetchMeals(month: String, day: String, year: String, mealID: Int, mealOfDay: String) {
        HomeScreenCall().getMeals(month: month, day: day, year: year, mealID: mealID, mealOfDay: mealOfDay) {
            self.meals = $0
        }
    }
    
    func fetchIDs(month: String, day: String, year: String) {
        
        HomeScreenCall().getIDs(month: month, day: day, year: year) {
            self.ids = $0
        }
        
        do {
            sleep(1)
        }
        
    }
    
    func chooseMeals(mealID: Int) {
        
        HomeScreenCall().chooseMeals(mealID: mealID) {
            self.mealsFromID = $0
        }
        
        do {
            sleep(1)
        }
        
    }
    
    let didChange = PassthroughSubject<HomeScreenViewModel, Never>()
    
}