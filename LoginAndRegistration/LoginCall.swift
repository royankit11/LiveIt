//
//  LoginCall.swift
//  Live It (iOS)
//
//  Created by Rik Roy on 9/19/21.
//

import Foundation

class LoginCall {
    
    func getUser(username: String, password: String, completion: @escaping ([LoginModel]) -> ()) {
        guard let url = URL(string: "http://10.0.0.110:5000/getUser/" + username + "/" + password)
        else {
            fatalError("URL is not correct!")
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            
                let success = try! JSONDecoder().decode([LoginModel].self, from: data!)
            
            DispatchQueue.main.async {
                completion(success)
            }
            }.resume()
    }
    
    func registerUser(firstName: String, username: String, password: String, age: Int, gender: String, height: Int, weight: Int, activity: String, completion: @escaping ([RegisterModel]) -> ()) {
        guard let url = URL(string: "http://10.0.0.110:5000/Register/" + firstName + "/" + username + "/" + password + "/" + String(age) + "/" + gender + "/" + String(height) + "/" + String(weight) + "/" + activity)
                
        else {
            fatalError("URL is not correct!")
        }
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            
                let success = try! JSONDecoder().decode([RegisterModel].self, from: data!)
            
            DispatchQueue.main.async {
                completion(success)
            }
            }.resume()
    }

}
