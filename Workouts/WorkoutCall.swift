//
//  WorkoutCall.swift
//  Live It
//
//  Created by Rik Roy on 9/21/21.
//

import Foundation
import Combine


class WorkoutCall {
    
    func getWorkouts(completion: @escaping ([WorkoutModel]) -> ()) {
        guard let url = URL(string: "http://10.0.0.110:5000/getWorkouts")
        else {
            fatalError("URL is not correct!")
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            
            let meals = try! JSONDecoder().decode([WorkoutModel].self, from: data!)
            
            DispatchQueue.main.async {
                completion(meals)
            }
            }.resume()
    }
}
