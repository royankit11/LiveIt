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
    let fName: String
    let username: String
    let password: String
    let age: Int
    let gender: String
    let height: Int
    let weight: Int
    let activity: String
    let Error: String
}
