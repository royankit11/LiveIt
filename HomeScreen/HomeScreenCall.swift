//
//  HomeScreenCall.swift
//  Live It (iOS)
//
//  Created by Rik Roy on 8/31/21.
//

import Foundation
import Combine


class HomeScreenCall {
    
    func getMeals(month: String, day: String, year: String, mealID: Int, mealOfDay: String, completion: @escaping ([HomeScreenModel]) -> ()) {
        guard let url = URL(string: "http://10.0.0.110:5000/chooseDailyMeals/" + month + "/" + day + "/" + year + "/" + String(mealID) + "/" + mealOfDay)
        else {
            fatalError("URL is not correct!")
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            
            let success = try! JSONDecoder().decode([HomeScreenModel].self, from: data!)
            
            DispatchQueue.main.async {
                completion(success)
            }
            }.resume()
    }
    
    func getIDs(month: String, day: String, year: String, completion: @escaping ([HomeScreenIDModel]) -> ()) {
        guard let url = URL(string: "http://10.0.0.110:5000/returnMealIDs/" + month + "/" + day + "/" + year)
        else {
            fatalError("URL is not correct!")
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            
            let ids = try! JSONDecoder().decode([HomeScreenIDModel].self, from: data!)
            
            DispatchQueue.global().async {
                completion(ids)
            }
            }.resume()
    }
    
    func chooseMeals(mealID: Int, completion: @escaping ([MealItemModel]) -> ()) {
        guard let url = URL(string: "http://10.0.0.110:5000/returnMeals/" + String(mealID))
        else {
            fatalError("URL is not correct!")
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            
            let meals = try! JSONDecoder().decode([MealItemModel].self, from: data!)
            
            DispatchQueue.global().async {
                completion(meals)
            }
            }.resume()
    }
    
    func getWorkouts(month: String, day: String, year: String, workoutID: Int, completion: @escaping ([HomeScreenModel]) -> ()) {
        guard let url = URL(string: "http://10.0.0.110:5000/chooseDailyWorkouts/" + month + "/" + day + "/" + year + "/" + String(workoutID))
        else {
            fatalError("URL is not correct!")
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            
            let success = try! JSONDecoder().decode([HomeScreenModel].self, from: data!)
            
            DispatchQueue.main.async {
                completion(success)
            }
            }.resume()
    }
    
    func chooseWorkouts(workoutID: Int, completion: @escaping ([WorkoutModel]) -> ()) {
        guard let url = URL(string: "http://10.0.0.110:5000/returnWorkouts/" + String(workoutID))
        else {
            fatalError("URL is not correct!")
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            
            let meals = try! JSONDecoder().decode([WorkoutModel].self, from: data!)
            
            DispatchQueue.global().async {
                completion(meals)
            }
            }.resume()
    }
}
