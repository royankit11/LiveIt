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
    
    
    func getUser(strUsername: String, strPassword: String) {
        LoginCall().getUser(username: strUsername, password: strPassword){
            self.users = $0
        }
        

        
    }
    
    
    let didChange = PassthroughSubject<LoginViewModel, Never>()
    
}

