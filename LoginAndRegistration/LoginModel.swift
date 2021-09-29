//
//  LoginModel.swift
//  Live It (iOS)
//
//  Created by Rik Roy on 9/19/21.
//

import Foundation
import SwiftUI
struct LoginModel: Codable, Hashable, Identifiable {
    var id: Int
    var fName: String
    var lName: String
    var username: String
    var password: String
    var age: Int
    var gender: String
    var height: Int
    var weight: Int
    var activity: String
    var Error: String
}
