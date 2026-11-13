//
//  CarItem.swift
//  Car Expense Tracker
//
//  Created by Suraj Srivastava on 10/28/26.
//

import Foundation
import SwiftUI
import SwiftData


@Model
class CarItem{
    var name:String
    var cost:Double
    var purchaseDate:Date
    
    init(name: String, cost: Double, purchaseDate: Date) {
        self.name = name
        self.cost = cost
        self.purchaseDate = purchaseDate
    }
    
}
