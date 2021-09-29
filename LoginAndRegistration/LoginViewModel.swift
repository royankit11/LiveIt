//
//  LoginViewModel.swift
//  Live It (iOS)
//
//  Created by Rik Roy on 9/19/21.
//

import Foundation
import Combine
import SwiftUI

class LoginViewModel: ObservableObject {
    
    var users = [LoginModel]() {
        didSet {
            didChange.send(self)
        }
    }
    
    var message = String() {
        didSet {
            didChange.send(self)
        }
    }
    
    var message2 = String() {
        didSet {
            didChange.send(self)
        }
    }
    
    
    func getUser(strUsername: String, strPassword: String) {
        LoginCall().getUser(username: strUsername, password: strPassword){
            self.users = $0
        }
        
        
    }
    
    func registerUser(firstName: String, lastName: String, username: String, password: String, age: Int, gender: String, height: Int, weight: Int, activity: String) {
        LoginCall().registerUser(firstName: firstName, lastName: lastName, username: username, password: password, age: age, gender: gender, height: height, weight: weight, activity: activity){
            self.message = $0
        }
        
        
    }
    
    func updateUser(username: String, fName: String, lName: String, age: Int, gender: String, height: Int, weight: Int, activity: String) {
        LoginCall().updateUser(username: username, fName: fName, lName: lName, age: age, gender: gender, height: height, weight: weight, activity: activity){
            self.message2 = $0
        }
        
        
    }
    
    
    let didChange = PassthroughSubject<LoginViewModel, Never>()
    
}

