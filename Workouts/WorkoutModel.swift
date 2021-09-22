//
//  WorkoutModel.swift
//  Live It
//
//  Created by Rik Roy on 9/21/21.
//

import Foundation
import SwiftUI
struct WorkoutModel: Codable, Hashable, Identifiable {
    var id: Int
    let Title : String
    let Link : String
    let ImageName : String
    let Calories : Int
    let Time : String
    let Error : String
}
