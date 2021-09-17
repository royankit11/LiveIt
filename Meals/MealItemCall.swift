//
//  MealItemCall.swift
//  Live It (iOS)
//
//  Created by Rik Roy on 8/30/21.
//

import Foundation

import Combine


class MealItemCall {
    
    func getMeals(mealOfDay: String, cals: Int, cuisines: String, completion: @escaping ([MealItemModel]) -> ()) {
        guard let url = URL(string: "http://10.0.0.110:5000/getMeals/" + mealOfDay + "/" + String(cals) + "/" + cuisines)
        else {
            fatalError("URL is not correct!")
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            
            let meals = try! JSONDecoder().decode([MealItemModel].self, from: data!)
            
            DispatchQueue.main.async {
                completion(meals)
            }
            }.resume()
    }
}
 
