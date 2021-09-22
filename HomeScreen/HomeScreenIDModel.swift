//
//  HomeScreenIDModel.swift
//  Live It (iOS)
//
//  Created by Rik Roy on 8/31/21.
//

import Foundation
import SwiftUI
struct HomeScreenIDModel: Codable, Hashable, Identifiable {
    var id: Int
    let B_ID: Int
    let L_ID: Int
    let D_ID: Int
    let W_ID: Int
    let Error: String
}
