//
//  MealItemModel.swift
//  Live It (iOS)
//
//  Created by Rik Roy on 8/30/21.
//

import Foundation
import SwiftUI
struct MealItemModel: Codable, Hashable, Identifiable {
    var id: Int
    let RecipeName : String
    let Link : String
    let ImageName : String
    let Calories : Int
    let MealOfDay : String
    let Cuisine : String
    let Error : String
}
