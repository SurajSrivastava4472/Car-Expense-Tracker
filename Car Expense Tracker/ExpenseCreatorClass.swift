//
//  ExpenseCreatorView.swift
//  Car Expense Tracker
//
//  Created by Suraj Srivastava on 10/29/26.
//

import Foundation
import SwiftData


@Model
class ExpenseCreatorClass{
    
    var carName:String
    var espenseAmount:Double
    var uid = UUID()
    var forWhat = ""
    var date:Date
    
    init(carName: String, espenseAmount: Double, forWhat: String, date: Date) {
        self.carName = carName
        self.espenseAmount = espenseAmount
        self.forWhat = forWhat
        self.date = date 
    }
    
    
    
}
